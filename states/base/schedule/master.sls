package_upgrades:
  schedule.present:
    - function: cmd.run
    - job_args:
      - 'salt --out=pprint "*" pkg.list_upgrades | mailx {{salt['pillar.get']('private:admin_email')}} -s "Package report"'
    - when: 8:30am
    - maxrunning: 1
