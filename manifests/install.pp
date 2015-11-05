class shinken::install (
  $ensure = $shinken::ensure,
  $user   = $shinken::user,
  $group  = $shinken::group,
) inherits shinken {

  class {'shinken::packages': }
  class {'shinken::pips': }

  file { 'shinken.ini':
    ensure  => $ensure,
    path    => '/root/.shinken.ini',
    mode    => '0644',
    owner   => $user,
    group   => $group,
    content => template("${module_name}/shinken.ini.erb"),
    require => Package['shinken'],
  }

  class {'shinken::modules':
    require => File['shinken.ini'],
  }
}
