base:
  '*':
    {%- if grains['os_family'] == 'Debian' %}
    - apt
    {%- endif %}
    - packages
