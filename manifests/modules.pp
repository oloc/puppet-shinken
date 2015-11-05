class shinken::modules (
  $ensure = $shinken::ensure,
) inherits shinken {

  $modules = ['mod-mongodb', 'snapshot-mongodb', 'retention-mongodb',
    'ui-graphite2',
    'webui2',
    'auth-cfg-password',
    'logstore-sqlite', 'livestatus',
    'graphite2',
    'ssh',
    'http',
    'linux-ssh',
    'linux-snmp']

  shinken::module {$modules:
    ensure  => $ensure,
  }
}
