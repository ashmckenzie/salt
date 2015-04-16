set_package_upgrades_available:
  grains.present:
    - name: 'package_upgrades_available'
    - value: False
