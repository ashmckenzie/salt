ubuntu_multiverse:
  pkgrepo.managed:
    - name: deb http://archive.ubuntu.com/ubuntu {{ grains['lsb_distrib_codename'] }} multiverse
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/ubuntu.list
    - enabled: true
    - disabled: false
    - refresh_db: true
