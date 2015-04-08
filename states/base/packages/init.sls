#!py

def run():
  config = {}
  packages = salt['pillar.get']('packages').values()
  packages_to_install = [y for x in map((lambda x: x['install']), packages) for y in x]
  packages_to_remove = [y for x in map((lambda x: x['remove']), packages) for y in x]

  print packages_to_install
  print packages_to_remove

  config['packages_to_install'] = {
    'pkg': [
      'installed',
      { 'pkgs': packages_to_install }
    ]
  }

  config['packages_to_remove'] = {
    'pkg': [
      'removed',
      { 'pkgs': packages_to_remove }
    ]
  }

  return config
