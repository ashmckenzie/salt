base:
  '*':
    {%- if grains['os'] == 'Ubuntu' %}
    - repos
    {% endif %}
    - packages
    - schedule
