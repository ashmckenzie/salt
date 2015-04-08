include:
  - schedule.minion
  {%- if salt['grains.get']('id') in salt['pillar.get']('private:master_names') %}
  - schedule.master
  {%- endif %}
