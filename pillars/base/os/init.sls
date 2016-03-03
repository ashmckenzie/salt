include:
  {%- if grains['os'] == 'Raspbian' %}
  - os.raspbian:
  {% elif grains['os'] == 'Ubuntu' %}
  - os.ubuntu:
  {%- endif %}
