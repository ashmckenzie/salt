at:
  pkg.installed:
    - name: at
  service.running:
    - name: atd
    - enable: True

/etc/salt/minion.d/main.conf:
  file.managed:
    - source: salt://config/salt/minion/main.conf.jinja
    - makedirs: True
  cmd.wait:
    - name: echo sv restart salt-minion | at now + 5 minute
    - watch:
      - file: /etc/salt/minion.d/main.conf
