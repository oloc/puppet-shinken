# == Class: shinken
#
# Full description of class shinken here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'shinken':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class shinken (
  $ensure      = 'present',
  $user        = 'shinken',
  $group       = 'shinken',
  $modules      = ['mod-mongodb', 'snapshot-mongodb', 'retention-mongodb',
                    'ui-graphite2', 'webui2', 'auth-cfg-password',
                    'logstore-sqlite', 'livestatus', 'graphite2', 'ssh', 'http',
                    'linux-ssh', 'linux-snmp'],
  $conf_dir    = '/etc/shinken',
  $modules_dir = '/etc/shinken/modules',
  $daemons_dir = '/etc/shinken/daemons',
) {

  validate_string($user)
  validate_string($group)
  validate_array($modules)

  if ($ensure in ['present', true]) {
    class { 'shinken::users': }->
    class { 'shinken::dirs': }->
    class { 'shinken::install': }->
    class { 'shinken::files': }->
    class { 'shinken::service': }
  } elsif ($ensure in ['absent', false]) {
    class { 'shinken::service':
      ensure => absent,
    }
    class { 'shinken::install':
      ensure => absent,
    }
    class { 'shinken::files':
      ensure => absent,
    }
    class { 'shinken::dirs':
      ensure => absent,
    }
    class { 'shinken::users':
      ensure => absent,
    }
  } else {
    notify{"Parameter ensure => ${ensure} is not managed.":}
  }

}
