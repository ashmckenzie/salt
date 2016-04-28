apt:
  mirrors:
    - host: "http://httpredir.debian.org"
      path: "debian/"
      distributions:
        - "jessie main contrib non-free"
        - "jessie-updates main"

    - host: "http://security.debian.org"
      path: ""
      distributions:
        - "jessie/updates main"
