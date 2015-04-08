checkin:
  schedule.present:
    - function: state.highstate
    - minutes: 30
    - splay: 30
    - maxrunning: 1
