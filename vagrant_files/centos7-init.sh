#!/usr/bin/env bash

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
yum -y install git puppet ruby-devel vim
mv /tmp/Gemfile /etc/puppet/
mv /tmp/Gemfile.lock /etc/puppet/
mv /tmp/hiera.yaml /etc/puppet/
mkdir -p /etc/puppet/hieradata
mkdir -p /etc/puppet/modules
gem install bundle rake --no-rdoc --no-ri
/usr/local/bin/bundle config --global silence_root_warning 1
pushd /etc/puppet
/usr/local/bin/bundle install
pushd modules/fail2ban
rm -f Puppetfile.lock
librarian-puppet install --verbose --path=/etc/puppet/modules
popd
popd
