define shinken::undef_package (
  $ensure         = $shinken::ensure,
  $package_name   = $title,
){
  if !defined(Package[$package_name]) {
    package { $package_name:
      ensure => $ensure,
    }
  }
}