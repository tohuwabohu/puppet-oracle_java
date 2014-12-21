# == Class: oracle_java::apt
#
# Manage the APT repository than contains Java packages.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2013 Martin Meinhold, unless otherwise noted.
#
class oracle_java::apt (
  $release,
  $key,
  $key_server,
) {
  apt::source { 'webupd8team-java':
    location    => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
    release     => $release,
    repos       => 'main',
    key         => $key,
    key_server  => $key_server,
    include_src => false,
  }
}
