salt_minion_upgrade:
  cmd.run:
    - name: |
        exec 0>&- # close stdin
        exec 1>&- # close stdout
        exec 2>&- # close stderr
        nohup /bin/sh -c 'salt-call --local cmd.run "pip install --upgrade salt" && salt-call --local cmd.run "service salt-minion restart' &
