class shinken::params {
  $ensure = 'present'
  $user   = 'shinken'
  $group  = 'shinken'

  $conf_dir    = '/etc/shinken'
  $modules_dir = "${conf_dir}/modules"
  $daemons_dir = "${conf_dir}/daemons"

  $packages = ['python-pycurl',
    'python-cherrypy3',
    'python-crypto',
    'nagios-plugins-standard',
    'mongodb',
    'python-pymongo']

  $modules = ['mod-mongodb',
    'snapshot-mongodb',
    'retention-mongodb',
    'webui2',
    'auth-cfg-password',
    'livestatus',
    'graphite',
    'ui-graphite',
    'ssh',
    'http',
    'linux-ssh',
    'linux-snmp']

}