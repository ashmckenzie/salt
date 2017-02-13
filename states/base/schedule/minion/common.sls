checkin:
  schedule.present:
    - function: state.apply
    - cron: '* */6 * * *'
