# == Class: java::apt
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
class java::apt {
  $apt_release = $::lsbdistid ? {
    'Debian' => 'precise',
    default  => $::lsbdistcodename,
  }

  apt::source { 'webupd8team':
    location    => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
    release     => $apt_release,
    repos       => 'main',
    key         => 'C2518248EEA14886',
    key_server  => 'keyserver.ubuntu.com',
    include_src => false,
  }
}
