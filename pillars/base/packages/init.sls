include:
  - packages.common:
      key: packages
  {%- if grains['os_family'] == 'Debian' %}
  - packages.debian:
      key: packages
  {% elif grains['os_family'] == 'MacOS' %}
  - packages.macos:
      key: packages
  {%- endif %}
