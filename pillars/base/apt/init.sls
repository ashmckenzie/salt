include:
  {%- if grains['os'] == 'Ubuntu' %}
  - apt.ubuntu:
      key: config
  {%- elif grains['os'] == 'Debian' %}
  - apt.debian:
      key: config
  {%- elif grains['os'] == 'Raspbian' %}
  - apt.raspbian:
      key: config
  {%- endif %}
