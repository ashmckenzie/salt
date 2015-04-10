package_upgrades:
  schedule.present:
    - function: pkg.list_upgrades
    - returner: yaml_smtp
    - when: 8:30am, 4:30pm
