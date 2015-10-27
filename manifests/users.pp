class shinken::users(
  $ensure  = $shinken::params::ensure,
  $user    = $shinken::params::user,
  $group   = $shinken::params::group,
) inherits shinken::params {

  group {'shinken group':
    ensure => present,
    name   => $group,
  }
  user {'shinken account':
    ensure => present,
    name   => $user,
    groups => $group,
  }
}