class shinken::install (
  $modules  = $shinken::params::modules,
  $packages = $shinken::params::packages,
) inherits shinken::params {

  $packs = hiera('shinken::packages')
  if (is_string($packs) or is_array($packs)) {
    $packages = $packs
  }
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
  
  $mod = hiera('shinken::modules')
  if (is_string($mod) or is_array($mod)) {
    $modules = $mod
  }
  shinken::module {$modules:
    require => Exec['shinken_init'],
  }
}