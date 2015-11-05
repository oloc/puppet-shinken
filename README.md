[![Build Status](https://travis-ci.org/oloc/puppet-shinken.png)](https://travis-ci.org/oloc/puppet-shinken)
# shinken

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with shinken](#setup)
    * [What shinken affects](#what-shinken-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with shinken](#beginning-with-shinken)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Public classes](#public-classes)
    * [Private classes](#private-classes)
    * [Private defines](#private-defines)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This puppet module installs [Shinken](http://www.shinken-monitoring.org/), an open source monitoring framework. 

## Module Description

Shinken is a useful open source monitoring framework, and this module provides a simplified way of creating configurations to manage your infrastructure.

This module installs Shinken and helps you to configure it.


## Setup

### What shinken affects

* Configuration files and directories (created and written to)
* package/service/configuration files for Shinken
* Shinken modules

### Setup Requirements

This module requires nothing extra before setting up.

### Beginning with shinken

To install Shinken with the default parameters:

~~~ puppet
    class { 'shinken': }
~~~

The defaults are determined as below, and you can establish customized parameters.

~~~ puppet
    class { 'shinken':
      ensure      => present,
      user        => 'shinken',
      group       => 'shinken',
      modules     => [],
      conf_dir    => '/etc/shinken',
      modules_dir => '/etc/shinken/modules',
      daemons_dir => '/etc/shinken/daemons',
    }
~~~

## Usage

This module modifies Shinken configuration files and directories and purges any configuration not managed by Puppet. Configuration of Shinken should be managed by Puppet, as non-Puppet configuration files can cause unexpected failures.

## Reference

### Classes

- [**Public Classes**](#public-classes)
    * [Class: shinken](#class-shinken): Guides the basic setup of Shinken.

- [**Private Classes**](#private-classes)
    * [Class: shinken::files](#private-files): Guides the files setup of Shinken.
    * [Class: shinken::install](#private-install): Install Shinken package and Shinken modules.
    * [Class: shinken::service](#private-service): Manage the Shinken services.
    * [Class: shinken::users](#private-users): Manage the Shinken user/group.

- [**Private Defines**](#private-defines)
    * [Define: shinken::file](#define-file): Manage templated file.
    * [Define: shinken::module](#define-module): Manage Shinken module.
    * [Define: shinken::undef_package](#define-undef_package): Install undefined package.

### Public Classes

#### Class: `shinken`
The shinken module's primary class, shinken, guides the basic setup of [Shinken](http://http://www.shinken-monitoring.org/) on your system.

You can use hiera to set some parameters.

**Parameters within `shinken`:**

##### `group`

Changes the group that Shinken will answer requests as. The parent process will continue to be run as root, but resource accesses by child processes will be done under this group. This group is also the owner group of the shinken items. _Default: shinken_

##### `user`

Changes the user that Shinken will answer requests as. The parent process will continue to be run as root, but resource accesses by child processes will be done under this user. This user is also the owner of the shinken items. _Default: shinken_

##### `modules`

is an array of shinken modules ([See the official list](http://www.shinken.io/browse/modules/updated).).

### Private Classes

#### Class: `shinken::files`
#### Class: `shinken::install`
#### Class: `shinken::service`
#### Class: `shinken::users`

### Private Defines

#### Define: `shinken::file`
#### Define: `shinken::module`
#### Define: `shinken::undef_package`

## Limitations

This module is CI tested on Centos 5 & 6, Ubuntu 12.04 & 14.04, Debian 6 & 7, and RHEL 6 & 7 platforms against the OSS version of Puppet.

## Development

oloc modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great.
Do not hesitate to contribute by pull requests.




