# -*- coding: utf-8 -*-

import os
import logging
import smtplib

try:
    import gnupg
    HAS_GNUPG = True
except ImportError:
    HAS_GNUPG = False

from email.utils import formatdate

class SMTPSender:

    def __init__(self, host='localhost', port=25, tls=False, gpgowner=None, user=None, password=None, log=None):
        self.host = host
        self.port = int(port)
        self.tls = tls
        self.gpgowner = gpgowner
        self.user = user
        self.password = password

        if log:
            self.log = log
        else:
            self.log = log = logging.getLogger(__name__)

    def send(self, to_addrs, from_addr, subject, content):

        if HAS_GNUPG and self.gpgowner:
            gpg = gnupg.GPG(gnupghome=os.path.expanduser('~{0}/.gnupg'.format(self.gpgowner)),
                            options=['--trust-model always'])
            encrypted_data = gpg.encrypt(content, to_addrs)
            if encrypted_data.ok:
                self.log.debug('yaml_smtp_return: Encryption successful')
                content = str(encrypted_data)
            else:
                self.log.error('yaml_smtp_return: Encryption failed, only an error message will be sent')
                content = 'Encryption failed, the return data was not sent.\r\n\r\n{0}\r\n{1}'.format(
                        encrypted_data.status, encrypted_data.stderr)

        message = ('From: {0}\r\n'
                   'To: {1}\r\n'
                   'Date: {2}\r\n'
                   'Subject: {3}\r\n'
                   '\r\n'
                   '{4}').format(from_addr,
                                 to_addrs,
                                 formatdate(localtime=True),
                                 subject,
                                 content)

        self.log.debug('SMTPSender.send: Connecting to the server host=[%s], port=[%s]', self.host, self.port)
        server = smtplib.SMTP(self.host, self.port)

        if self.tls is True:
            server.starttls()
            self.log.debug('SMTPSender.send: TLS enabled')
        if self.user and self.password:
            server.login(self.user, self.password)
            self.log.debug('SMTPSender.send: Authenticated')

        server.sendmail(from_addr, to_addrs, message)
        self.log.debug('SMTPSender.send: Message sent.')
        server.quit()
