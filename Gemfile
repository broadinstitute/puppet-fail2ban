source "https://rubygems.org"

puppetversion = ENV["PUPPET_VERSION"]

group :test do
    gem "json", "< 2.0.0"
    gem "metadata-json-lint"
    gem "puppet", puppetversion, :require => false
    gem "puppet-lint", ">= 0.3.2"
    gem "puppet-lint-unquoted_string-check"
    gem "puppetlabs_spec_helper", ">= 0.1.0"
    gem "puppet-syntax"
    gem "rake"
    gem "rspec", "< 3.2.0"
    gem "rspec-puppet"
end
