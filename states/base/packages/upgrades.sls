{% set package_upgrades = salt['pkg.list_upgrades'](refresh=False) %}

set_package_upgrades:
  grains.present:
    - name: 'package_upgrades'
    - value: "{{package_upgrades}}"

set_package_upgrades_available:
  grains.present:
    - name: 'package_upgrades_available'
    {% if package_upgrades|length > 0 %}
    - value: True
    {% else %}
    - value: False
    {% endif %}
