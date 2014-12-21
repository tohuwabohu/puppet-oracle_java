# == Define: java::package
#
# Install a certain Java package.
#
# === Parameters
#
# [*name*]
#   Set the package name.
#
# [*ensure*]
#   Set state the package should be in.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2013 Martin Meinhold, unless otherwise noted.
#
define java::package(
  $ensure = installed,
) {

  if $ensure !~ /present|installed|latest|^[.+_0-9a-zA-Z:-]+$/ {
    fail("Java::Package[${title}]: ensure must be either present, installed, latest or a version number, got '${ensure}'")
  }

  include java

  $preseed_content = $name ? {
    /^sun-java6-jdk$/          => template('java/sun-java6.preseed.erb'),
    /^oracle-java\d-installer$/ => "${name} shared/accepted-oracle-license-v1-1 select true",
    default                    => undef,
  }
  $preseed_ensure = empty($preseed_content) ? {
    false   => present,
    default => absent,
  }

  if $name =~ /oracle-java\d-installer/ and $::lsbdistid =~ /^(Debian|Ubuntu)$/ {
    class { 'java::apt':
      before => Package[$name],
    }
  }

  concat::fragment { "${name}.preseed":
    ensure  => $preseed_ensure,
    target  => $java::debian_preseed_file,
    content => $preseed_content,
  }

  package { $name:
    ensure       => $ensure,
    responsefile => $java::debian_preseed_file,
    require      => Concat[$java::debian_preseed_file]
  }
}
