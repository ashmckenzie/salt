# -*- coding: utf-8 -*-

import logging
import yaml
import pdb

import salt.client
import salt.utils

# HACK!
import sys
sys.path.append('/srv/salt/modules')

from smtp_sender import *

log = logging.getLogger(__name__)

def pkg_list_upgrades():
    client = salt.client.LocalClient(__opts__['conf_file'])
    raw_output = client.cmd('*', 'pkg.list_upgrades')
    output = yaml.dump(raw_output, default_flow_style=False)

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
        port = cfg.get('smtp.port', 25)
        user = cfg.get('smtp.username', None)
        passwd = cfg.get('smtp.password', None)
        subject = cfg.get('smtp.subject', '')
        gpgowner = cfg.get('smtp.gpgowner', None)
        fields = cfg.get('smtp.fields', '').split(',')
        smtp_tls = cfg.get('smtp.tls', False)

    subject += ' Available package upgrades'

    smtp_sender = SMTPSender(host, port, smtp_tls, gpgowner, user, passwd)
    smtp_sender.send(to_addrs, from_addr, subject, output)
    log.debug("custom.pkg_list_upgrades: " + format(raw_output))
