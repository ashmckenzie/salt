include:
  - schedule.minion.common
{%- if grains['os_family'] == 'MacOS' %}
  - schedule.minion.macos
{%- endif %}
