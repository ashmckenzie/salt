checkin:
  schedule.present:
    - function: state.highstate
    - minutes: 30
    - seconds: 0
    - splay: 30
