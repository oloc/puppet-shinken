class shinken::service (
  $ensure = present,
){

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