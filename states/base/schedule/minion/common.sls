checkin:
  schedule.present:
    - function: state.highstate
    - seconds: 3600
    - splay: 30
