set_custom_package_upgrades:
  grains.present:
    - name: custom_package_upgrades
    - value: False
