# == Class: java
#
# Manage the installation of Java version 6.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2013 Martin Meinhold, unless otherwise noted.
#
class java {
  $debian_preseed_file = '/var/cache/debconf/java.preseed'

  concat { $debian_preseed_file:
    ensure         => present,
    owner          => 'root',
    group          => 'root',
    mode           => '0444',
    force          => false,
    ensure_newline => true,
  }
}
