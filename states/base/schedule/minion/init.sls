include:
  - schedule.minion.common
{%- if grains['os_family'] == 'Debian' %}
  - schedule.minion.debian
{%- endif %}
