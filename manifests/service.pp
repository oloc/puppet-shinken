class shinken::service (
  $ensure = $shinken::ensure,
) inherits shinken {

  $service = $ensure ? {
    'present' => running,
    'absent'  => stopped,
  }
  service{ 'shinken':
    ensure     => $service,
    enable     => true,
    hasrestart => true,
  }

}