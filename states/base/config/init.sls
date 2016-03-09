include:
  {%- if grains['os_family'] == 'Debian' %}
  - config.apt
  {%- else %}
  []
  {%- endif %}
