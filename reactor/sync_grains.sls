# http://docs.saltstack.com/en/latest/topics/reactor/index.html#minion-start-reactor
sync_grains:
  local.saltutil.sync_grains:
    - tgt: {{data['id']}}
