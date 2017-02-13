checkin:
  schedule.present:
    - function: state.apply
    - seconds: 3600
    - splay: 30
