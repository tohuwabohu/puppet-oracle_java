# == Class: oracle_java
#
# Manage the installation of Java versions.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2013 Martin Meinhold, unless otherwise noted.
#
class oracle_java (
  $preseed_file = $oracle_java::params::preseed_file,
) inherits oracle_java::params {
  concat { $preseed_file:
    ensure         => present,
    owner          => 'root',
    group          => 'root',
    mode           => '0444',
    force          => true,
    ensure_newline => true,
  }
}
