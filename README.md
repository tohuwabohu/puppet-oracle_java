#oracle_java

##Overview

Install one or multiple Oracle Java packages on Debian-based systems.

##Usage

_Note: By using this module you will automatically accept the Oracle agreement to download Java._

Example:

```
java::package { 'oracle-java6-installer': }
```

- or

```
java::package { 'oracle-java6-installer':
  ensure => latest,
}
```

##Limitations

The module has been tested on the following operating systems. Testing and patches for other platforms are welcome.

* Debian Linux 7.0

[![Build Status](https://travis-ci.org/tohuwabohu/puppet-oracle_java.png?branch=master)](https://travis-ci.org/tohuwabohu/puppet-oracle_java)

##Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

###Development

This project uses rspec-puppet and beaker to ensure the module works as expected and to prevent regressions.

```
gem install bundler
bundle install --path vendor

bundle exec rake spec
bundle exec rake beaker
```
(note: use `RS_PROVISION=no` and `RS_DESTROY=no` to control beaker default behaviour)
