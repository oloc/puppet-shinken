require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

require 'rspec-puppet-facts'
include RspecPuppetFacts

require 'puppet-lint'
require 'rspec/its'
PuppetLint::Plugins.load_spec_helper