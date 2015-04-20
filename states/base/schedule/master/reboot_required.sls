salt-run custom.execute 'G@reboot_required:True' status.uptime:
  cron.present:
    - identifier: REBOOT_REQUIRED
    - user: root
    - hour: 8
    - minute: 30
