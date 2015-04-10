# http://grokbase.com/t/gg/salt-users/1488qhxza3/return-smtp-from-reactor
# http://docs.saltstack.com/en/latest/topics/reactor/#a-complete-example
highstate_run:
  local.state.highstate:
    - tgt: {{data['id']}}
    - ret: yaml_smtp
