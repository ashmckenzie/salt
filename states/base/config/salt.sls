/etc/salt/minion.d/main.conf:
  file.managed:
    - source: salt://config/salt/minion/main.conf.jinja
    - makedirs: True
