check_software_update:
  schedule.present:
    - function: softwareupdate.list_upgrades
    - when: 9:30am
    - return: yaml_smtp
