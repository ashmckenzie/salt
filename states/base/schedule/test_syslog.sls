test_syslog:
  module.run:
    - name: test.ping
    - returner: syslog
