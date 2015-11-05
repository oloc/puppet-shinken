class shinken::packages (
  $ensure = $shinken::ensure,
) inherits shinken {

  $packages = ['python-pip',
    'python-pycurl',
    'python-cherrypy3',
    'python-crypto',
    'nagios-plugins-standard',
    'mongodb',
    'python-pymongo']

  shinken::undef_package { $packages:
    ensure => $ensure,
  }

}