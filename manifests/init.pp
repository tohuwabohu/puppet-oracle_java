# == Class: java
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
class java (
  $preseed_file
) {

  concat { $preseed_file:
    ensure         => present,
    owner          => 'root',
    group          => 'root',
    mode           => '0444',
    force          => true,
    ensure_newline => true,
  }
}
