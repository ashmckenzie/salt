base:
  '*':
    {%- if grains['os_family'] == 'Debian' %}
    - config
    {%- endif %}
    - packages
    - schedule
