/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - template: jinja
    - source: salt://files/config/apt/unattended_upgrades.jinja
    - defaults:
        email: ash@the-rebellion.net
