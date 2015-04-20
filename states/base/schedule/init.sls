include:
  {%- if salt['grains.get']('id') in salt['pillar.get']('master_names') %}
  - schedule.master
  {% endif %}
  - schedule.minion
