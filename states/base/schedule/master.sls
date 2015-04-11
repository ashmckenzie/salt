package_upgrades:
  schedule.present:
    - function: cmd.run
    - when: 8:30am, 4:30pm
    - job_args:
      - 'salt --out=json "*" pkg.list_upgrades | mailx {{salt['pillar.get']('private:admin_email')}} -s "Salt report: all package upgrades"'
