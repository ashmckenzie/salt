# -*- coding: utf-8 -*-

import os.path

def reboot_required():
  grains = {}
  grains['reboot_required'] = os.path.isfile('/var/run/reboot-required')

  return grains
