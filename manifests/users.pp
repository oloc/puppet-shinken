class shinken::users(
  $ensure  = $shinken::ensure,
  $user    = $shinken::user,
  $group   = $shinken::group,
) inherits shinken {

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