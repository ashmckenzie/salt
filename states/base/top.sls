base:
  '*':
    {%- if grains['os'] == 'Ubuntu' %}
    - repos
    - config
    {% endif %}
    {%- if grains['family'] == 'Debian' %}
    - config
    {% endif %}
    - packages
    - schedule
