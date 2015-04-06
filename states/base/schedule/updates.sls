updates:
  schedule.present:
    - function: cmd.run
    - job_args:
      - 'salt --out=pprint "*" pkg.list_upgrades | mailx ash@the-rebellion.net -s "Package report"'
    - hours: 8
    - minutes: 30
    - maxrunning: 1
