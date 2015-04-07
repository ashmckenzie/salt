packages_to_install:
  pkg.installed:
    - pkgs: {{salt['pillar.get']('packages:install', [])}}

packages_to_remove:
  pkg.removed:
    - pkgs: {{salt['pillar.get']('packages:remove', [])}}
