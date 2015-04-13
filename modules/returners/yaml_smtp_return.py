# -*- coding: utf-8 -*-
'''
Return salt data via email in YAML format

The following fields can be set in the minion conf file::

    smtp.from (required)
    smtp.to (required)
    smtp.host (required)
    smtp.port (optional, defaults to 25)
    smtp.username (optional)
    smtp.password (optional)
    smtp.tls (optional, defaults to False)
    smtp.subject (optional, but helpful)
    smtp.gpgowner (optional)
    smtp.fields (optional)

There are a few things to keep in mind:

* If a username is used, a password is also required. It is recommended (but
  not required) to use the TLS setting when authenticating.
* You should at least declare a subject, but you don't have to.
* The use of encryption, i.e. setting gpgowner in your settings, requires
  python-gnupg to be installed.
* The field gpgowner specifies a user's ~/.gpg directory. This must contain a
  gpg public key matching the address the mail is sent to. If left unset, no
  encryption will be used.
* smtp.fields lets you include the value(s) of various fields in the subject
  line of the email. These are comma-delimited. For instance::

    smtp.fields: id,fun

  ...will display the id of the minion and the name of the function in the
  subject line. You may also use 'jid' (the job id), but it is generally
  recommended not to use 'return', which contains the entire return data
  structure (which can be very large). Also note that the subject is always
  unencrypted.

  To use the SMTP returner, append '--return smtp' to the salt command. ex:

  .. code-block:: bash

    salt '*' test.ping --return smtp

'''

import logging
import yaml

# from email.utils import formatdate

import salt.utils

# HACK!
import sys
sys.path.append('/srv/salt/modules')

from smtp_sender import *

log = logging.getLogger(__name__)

__virtualname__ = 'yaml_smtp'

def __virtual__():
    return __virtualname__

def returner(ret):
    '''
    Send an email with the data
    '''

    if 'config.option' in __salt__:
        from_addr = __salt__['config.option']('smtp.from')
        to_addrs = __salt__['config.option']('smtp.to')
        host = __salt__['config.option']('smtp.host')
        port = __salt__['config.option']('smtp.port')
        user = __salt__['config.option']('smtp.username')
        passwd = __salt__['config.option']('smtp.password')
        subject = __salt__['config.option']('smtp.subject')
        gpgowner = __salt__['config.option']('smtp.gpgowner')
        fields = __salt__['config.option']('smtp.fields').split(',')
        smtp_tls = __salt__['config.option']('smtp.tls')
    else:
        cfg = __opts__
        from_addr = cfg.get('smtp.from', None)
        to_addrs = cfg.get('smtp.to', None)
        host = cfg.get('smtp.host', None)
        port = cfg.get('smtp.port', None)
        user = cfg.get('smtp.username', None)
        passwd = cfg.get('smtp.password', None)
        subject = cfg.get('smtp.subject', None)
        gpgowner = cfg.get('smtp.gpgowner', None)
        fields = cfg.get('smtp.fields', '').split(',')
        smtp_tls = cfg.get('smtp.tls', False)

    if not port:
        port = 25

    for field in fields:
        if field in ret:
            subject += ' {0}'.format(ret[field])

    log.debug("yaml_smtp_return: Subject is '{0}'".format(subject))

    out = ret.get('return')
    formatted_out = yaml.dump(out, default_flow_style=False)

    content = ('ID: {0}\r\n'
               'Function: {1}\r\n'
               'Function args: {2}\r\n'
               'JID: {3}\r\n'
               '\r\n'
               '{4}\r\n').format(
                    ret.get('id'),
                    ret.get('fun'),
                    ret.get('fun_args'),
                    ret.get('jid'),
                    formatted_out)

    smtp_sender = SMTPSender(host, port, smtp_tls, gpgowner, user, passwd, log)
    smtp_sender.send(to_addrs, from_addr, subject, content)

def prep_jid(nocache, passed_jid=None):  # pylint: disable=unused-argument
    '''
    Do any work necessary to prepare a JID, including sending a custom id
    '''
    return passed_jid if passed_jid is not None else salt.utils.gen_jid()
