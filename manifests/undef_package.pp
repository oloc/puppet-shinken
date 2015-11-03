define shinken::undef_package (
  $package_ensure = $shinken::ensure,
  $package_name   = $title,
){
  if !defined(Package[$package_name]) {
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}