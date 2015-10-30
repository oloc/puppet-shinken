source "https://rubygems.org"

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.0.0','< 4.0']
gem "rake"
gem "puppet", puppetversion
gem "puppet-lint"
gem "puppetlabs_spec_helper"
gem "puppet-syntax"
gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
gem 'rspec', '< 2.99'