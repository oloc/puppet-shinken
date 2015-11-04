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

  $modules = ['mod-mongodb', 'snapshot-mongodb', 'retention-mongodb',
    'ui-graphite2',
    'webui2',
    'auth-cfg-password',
    'logstore-sqlite', 'livestatus',
    'graphite2',
    'ssh',
    'http',
    'linux-ssh',
    'linux-snmp']

  shinken::undef_package { $packages:
    ensure => $ensure,
  }

  $pip = ['shinken', 'pymongo', 'requests', 'arrow', 'bottle']
  package { $pip:
    ensure   => $ensure,
    provider => pip,
    require  => [Package['python-pip'], Package['python-pycurl'], User['shinken'],]
  }

  file { 'shinken.ini':
    ensure  => $ensure,
    path    => '/root/.shinken.ini',
    mode    => '0644',
    owner   => $user,
    group   => $group,
    content => template("${module_name}/shinken.ini.erb"),
    require => Package['shinken'],
  }

  shinken::module {$modules:
    ensure  => $ensure,
    require => File['shinken.ini'],
  }
}
