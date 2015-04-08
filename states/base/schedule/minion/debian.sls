check_reboot_required:
  schedule.present:
    - function: cmd.run
    - job_args:
      - '[ -f /var/run/reboot-required ] && uname -a | mailx {{salt['pillar.get']('private:admin_email')}} -s "Reboot required for `uname -n`"'
    - when: 9:30am
    - maxrunning: 1
