base:
  '*':
    {%- if grains['os'] == 'Ubuntu' %}
    - repos
    {% endif %}
    {%- if grains['os_family'] == 'Debian' %}
    - config
    - apt
    {% endif %}
    - packages
    - schedule
