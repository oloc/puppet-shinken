class shinken::files (
  $ensure      = $shinken::params::ensure,
  $user        = $shinken::params::user,
  $group       = $shinken::params::group,
) inherits shinken::params {

  $dirs=['/etc/shinken','/var/lib/shinken','/var/log/shinken','/var/run/shinken',
    $modules_dir, $daemons_dir,"${conf_dir}/brokers"]
  file {$dirs:
    ensure => directory,
    mode   => '0755',
    owner  => $user,
    group  => $group,
  }

  file { "${conf_dir}/shinken.cfg":
    ensure => file,
    mode   => '0644',
    owner  => $user,
    group  => $group,
  }

  $daemons = ['brokerd.ini', 'pollerd.ini', 'reactionnerd.ini', 'receiverd.ini', 'schedulerd.ini']
  shinken::file { $daemons:
    ensure => file,
    path   => $daemons_dir,
    mode   => '0644',
    owner  => $user,
    group  => $group,
  }

  $mod = ['webui2.cfgr', 'mongodb.cfg']
  shinken::file { $mod:
    ensure => file,
    path   => $modules_dir,
    mode   => '0644',
    owner  => $user,
    group  => $group,
  }
  file { "${conf_dir}/brokers/broker-master.cfg":
    ensure => file,
    mode   => '0644',
    owner  => $user,
    group  => $group,
    source => "puppet:///modules/${module_name}/broker-master.cfg",
  }
}
