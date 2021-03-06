# == Define: oracle_java::package
#
# Manage Oracle Java packages.
#
# === Parameters
#
# [*ensure*]
#   Set state the package should be in. Can be either `present`, `installed`, `absent` or a version number.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2013 Martin Meinhold, unless otherwise noted.
#
define oracle_java::package (
  $ensure = installed,
) {
  if $ensure !~ /present|installed|latest|^[.+_0-9a-zA-Z:-]+$/ {
    fail("Oracle_Java::Package[${title}]: ensure must be either present, installed, latest or a version number, got '${ensure}'")
  }

  if $name !~ /^oracle-java\d-installer$/ {
    warning("Oracle_Java::Package[${title}]: only Oracle installer packages supported, package '${title}' may not work as expeced")
  }

  include oracle_java
  require oracle_java::apt

  $preseed_ensure = $ensure ? {
    absent  => absent,
    default => present,
  }

  concat::fragment { "${title}.preseed":
    ensure  => $preseed_ensure,
    target  => $oracle_java::preseed_file,
    content => "${title} shared/accepted-oracle-license-v1-1 select true",
  }

  package { $title:
    ensure       => $ensure,
    responsefile => $oracle_java::preseed_file,
    require      => Concat[$oracle_java::preseed_file],
  }
}
