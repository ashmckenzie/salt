salt-run custom.execute '*' pkg.list_upgrades:
  cron.present:
    - identifier: PKG_LIST_UPGRADES
    - user: root
    - hour: '7,16'
    - minute: 30
