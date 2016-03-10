include:
  - config.salt
  {%- if grains['os_family'] == 'Debian' %}
  - config.apt
  {%- endif %}
