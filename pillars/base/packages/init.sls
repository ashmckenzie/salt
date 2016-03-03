include:
  - packages.common:
      key: config
  {%- if grains['os_family'] == 'Debian' %}
  - packages.debian:
      key: config
  {%- if grains['os'] == 'Ubuntu' %}
  - packages.ubuntu:
      key: config
  {%- endif %}
  {% elif grains['os_family'] == 'MacOS' %}
  - packages.macos:
      key: config
  {%- endif %}
