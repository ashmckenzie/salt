base:
  '*':
    {%- if grains['os'] == 'Ubuntu' %}
    - repos
    {% endif %}
    {%- if grains['os_family'] == 'Debian' %}
    - config
    {% endif %}
    - packages
    - schedule
