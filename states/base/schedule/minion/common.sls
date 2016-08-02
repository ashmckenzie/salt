checkin:
  schedule.present:
    - function: state.highstate
    - cron: '* */6 * * *'
