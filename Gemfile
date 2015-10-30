source "https://rubygems.org"

group :development do
  gem "puppet-blacksmith"
end

group :rake do
  puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.0.0','< 4.0']
  gem "rake"
  gem "puppet", puppetversion
  gem "puppet-lint"
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem "puppet-syntax"
  gem "puppetlabs_spec_helper"
  gem 'rspec', '< 2.99'
end
