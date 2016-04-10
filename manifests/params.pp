# == Class: oracle_java::params
#
# Default values of the oracle_java class.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2016 Martin Meinhold, unless otherwise noted.
#
class oracle_java::params {
  $preseed_file = '/var/cache/debconf/java.preseed'

  $apt_release = $::lsbdistid ? {
    'Debian' => 'precise',
    default  => $::lsbdistcodename,
  }
  $apt_key = 'C2518248EEA14886'
  $apt_key_server = 'keyserver.ubuntu.com'
}
