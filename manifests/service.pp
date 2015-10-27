class shinken::service (
  $ensure = present,
){

  $service = $ensure ? {
  	'present' => runnning,
    'absent'  => stopped,
  }
  service{ 'shinken':
    ensure     => $service,
    enable     => true,
    hasrestart => true,
  }

}