define shinken::module (
  $mod_name = $title,
){
  exec{"install_${mod_name}":
    command => "/usr/bin/shinken install ${mod_name}",
    unless  => "/usr/bin/shinken inventory | grep ${mod_name} 2>/dev/null",
  }
}