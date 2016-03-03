include:
  {%- if grains['os'] == 'Raspbian' %}
  - apt.raspbian:
      key: config
  {%- elif grains['os'] == 'Ubuntu' %}
  - apt.ubuntu:
      key: config
  {%- endif %}
