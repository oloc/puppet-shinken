define shinken::file (
  $file_name = $title,
  $path      = undef,
  $ensure    = file,
  $mode      = '0644',
  $owner     = $shinken::params::user,
  $group     = $shinken::params::group,
){
  include shinken::params
  
  if $path {
    $fq_name = "${path}/${file_name}"
  } else {
    $fq_name = $file_name
  }

  file { $fq_name:
    ensure => $ensure,
    mode   => $mode,
    owner  => $owner,
    group  => $group,
    source => "puppet:///modules/${module_name}/${file_name}",
  }
}
