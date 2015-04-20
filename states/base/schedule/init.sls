include:
  {%- if grains['id'] == 'master1' %}
  - schedule.master
  {% endif %}
  - schedule.minion
