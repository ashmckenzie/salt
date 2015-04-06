include:
  - schedule.checkin
  {%- if salt['grains.get']('id') == 'the-rebellion' %}
  - schedule.updates
  {%- endif %}
