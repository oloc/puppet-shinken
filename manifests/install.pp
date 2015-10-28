class shinken::install (
  $modules  = $shinken::modules,
) inherits shinken {

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

  shinken::undef_package { $packages: }

  class { 'python' :
    version => 'system',
    pip     => 'present',
  }
  python::pip { 'shinken' :
    ensure  => '2.4',
    pkgname => 'shinken',
    timeout => 1800,
    before  => Exec['shinken_init']
  }

  exec{'shinken_init':
    command => '/usr/bin/shinken --init',
    unless  => '/bin/ls -l /root/.shinken.ini',
  }
  
  shinken::module {$modules:
    require => Exec['shinken_init'],
  }
}
