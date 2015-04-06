{% for package in salt['pillar.get']('packages:install', []) %}
{{package}}:
  pkg:
    - installed
{% endfor %}

{% for package in salt['pillar.get']('packages:remove', []) %}
{{package}}:
  pkg:
    - removed
{% endfor %}
