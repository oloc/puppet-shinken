class shinken::install (
  $ensure = $shinken::ensure,
  $user   = $shinken::user,
  $group  = $shinken::group,
) inherits shinken {

  $packages = ['python-pip',
    'python-pycurl',
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

  shinken::undef_package { $packages:
    ensure => $ensure,
  }

  package { 'shinken':
    ensure   => $ensure,
    provider => pip,
    require  => [Package['pip'], Package['pycurl'], User['shinken'],]
  }

  shinken::file { 'shinken.ini':
    ensure  => $ensure,
    path    => '/root/.shinken.ini',
    mode    => '0644',
    owner   => $user,
    group   => $group,
    require => Package['shinken'],
  }

  shinken::module {$modules:
    require => Exec['shinken_init'],
  }
}
