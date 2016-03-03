unattended-upgrades:
  pkg.installed

/etc/apt/sources.list
  file.managed:
    - template: jinja
    - source: salt://config/apt/sources.list.jinja
    - defaults:
        mirror_host: {{ salt['pillar.get']('apt.mirror_host') }}
        mirror_path: {{ salt['pillar.get']('apt:mirror_path') }}
        distributions: {{ salt['pillar.get']('apt:distributions') }}

/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - template: jinja
    - source: salt://config/apt/periodic.jinja
    - defaults:
        enabled: 1

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - template: jinja
    - source: salt://config/apt/unattended_upgrades.jinja
    - defaults:
        email: ash@the-rebellion.net
