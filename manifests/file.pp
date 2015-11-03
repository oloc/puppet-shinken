define shinken::file (
  $ensure    = file,
  $file_name = $title,
  $path      = undef,
  $mode      = '0644',
  $owner     = $shinken::user,
  $group     = $shinken::group,
){

  $ensure_file = $ensure ? {
    /(present|file)/ => file,
    absent           => absent,
  }
  
  if $path {
    $fq_name = "${path}/${file_name}"
  } else {
    $fq_name = $file_name
  }

  file { $fq_name:
    ensure  => $ensure_file,
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    content => template("${module_name}/${file_name}.erb"),
  }
}
