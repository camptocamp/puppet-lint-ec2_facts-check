puppet-ec2_facts-check
====================================

[![Build Status](https://img.shields.io/travis/camptocamp/puppet-ec2_facts-check.svg)](https://travis-ci.org/camptocamp/puppet-ec2_facts-check)
[![Gem Version](https://img.shields.io/gem/v/puppet-ec2_facts-check.svg)](https://rubygems.org/gems/puppet-ec2_facts-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-ec2_facts-check.svg)](https://rubygems.org/gems/puppet-ec2_facts-check)
[![Coverage Status](https://img.shields.io/coveralls/camptocamp/puppet-ec2_facts-check.svg)](https://coveralls.io/r/camptocamp/puppet-ec2_facts-check?branch=master)
[![Gemnasium](https://img.shields.io/gemnasium/camptocamp/puppet-ec2_facts-check.svg)](https://gemnasium.com/camptocamp/puppet-ec2_facts-check)

A puppet-lint plugin to check for old ec2\_\* facts.

## Installing

### From the command line

```shell
$ gem install puppet-ec2_facts-check
```

### In a Gemfile

```ruby
gem 'puppet-ec2_facts-check', :require => false
```

## Checks

### Old ec2\_ fact used

The old `ec2\_\*` facts are not available anymore in facter3 and thus should not be used anymore.
You should you the new `ec2_metadata` fact.

#### What you have done

```puppet
notice($::ec2_public_hostname)
```

#### What you should have done

```puppet
notice($::ec2_metadata['hostname'])
```

#### Disabling the check

To disable this check, you can add `--no-ec2_facts-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-ec2_facts-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_ec2_facts')
```

