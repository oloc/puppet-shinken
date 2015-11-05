class shinken::pips (
  $ensure = $shinken::ensure,
) inherits shinken {

  $pip = ['shinken', 'pymongo', 'requests', 'arrow', 'bottle']
  package { $pip:
    ensure   => $ensure,
    provider => pip,
  }

}
