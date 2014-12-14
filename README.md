#java

##Overview

Install one or multiple Java packages.

##Usage

_Note: By using this module you will automatically accept the Oracle agreement to download Java._

Example:

```
java::package { 'sun-java6-jdk': }
```

- or

```
java::package { 'oracle-java6-installer':
  ensure => latest,
}
```

##Limitations

The module has been tested on the following operating systems. Testing and patches for other platforms are welcome.

* Debian Linux 6.0 (Squeeze)

[![Build Status](https://travis-ci.org/tohuwabohu/puppet-java.png?branch=master)](https://travis-ci.org/tohuwabohu/puppet-java)

##Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
