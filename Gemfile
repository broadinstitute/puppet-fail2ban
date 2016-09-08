source "https://rubygems.org"

puppetversion = ENV["PUPPET_GEM_VERSION"]

group :test do
    gem "json", "< 2.0.0", :platform => 'ruby_19'
    gem "json_pure", "< 2.0.0", :platform => 'ruby_19'
    gem "metadata-json-lint"
    gem 'facter', '>= 1.7.0'
    gem "puppet", puppetversion, :require => false
    gem 'librarian-puppet'
    gem "puppet-lint", ">= 0.3.2"
    gem "puppet-lint-unquoted_string-check"
    gem "puppetlabs_spec_helper", ">= 0.1.0"
    gem "puppet-syntax"
    gem "rake"
    gem "rspec"
    gem "rspec-puppet"
    gem 'rspec-puppet-facts'
end
