salt-run custom.execute '*' grains.get package_upgrades:
  cron.present:
    - identifier: PKG_LIST_UPGRADES
    - user: root
    - hour: '6,16'
    - minute: 30
