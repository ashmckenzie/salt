/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - template: jinja
    - source: salt://config/unattended_upgrades.jinja
    - defaults:
        email: ash@the-rebellion.net
