include:
  {%- if grains['os'] == 'Ubuntu' %}
  - repos.ubuntu
  {%- endif %}
