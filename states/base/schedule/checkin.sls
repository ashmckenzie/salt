checkin:
  schedule.present:
    - function: state.highstate
    - minutes: 30
    - maxrunning: 1
    - splay: 30
