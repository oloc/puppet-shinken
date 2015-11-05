class shinken::dirs (
  $ensure      = $shinken::ensure,
  $user        = $shinken::user,
  $group       = $shinken::group,
  $conf_dir    = $shinken::conf_dir,
  $modules_dir = $shinken::modules_dir,
  $daemons_dir = $shinken::daemons_dir,
) inherits shinken {

  $ensure_dir = $ensure ? {
    present => directory,
    absent  => absent,
  }

  $masters = ['arbiters', 'brokers', 'pollers', 'reactionners','receivers','schedulers']
  $dirs = union(['/etc/shinken', '/etc/shinken/packs','/var/lib/shinken','/var/log/shinken','/var/run/shinken'],
    [$modules_dir, $daemons_dir],
    prefix($masters, "${conf_dir}/"))
  file {$dirs:
    ensure => $ensure_dir,
    force  => true,
    mode   => '0755',
    owner  => $user,
    group  => $group,
  }
}