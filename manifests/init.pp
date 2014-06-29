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

  file { '/var/cache/debconf/sun-java6.preseed':
    source => 'puppet:///modules/java/sun-java6.preseed',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  package { 'sun-java6-jdk':
    ensure       => latest,
    responsefile => '/var/cache/debconf/sun-java6.preseed',
    require      => File['/var/cache/debconf/sun-java6.preseed']
  }

}
