check_reboot_required:
  schedule.present:
    - function: cmd.run
    - when: 9:30am
    - job_args:
      - '[ -f /var/run/reboot-required ] && uname -a | mailx {{salt['pillar.get']('private:admin_email')}} -s "Salt report: `uname -n` reboot required"'
