#!/bin/bash
cat > /etc/apt/sources.list.d/puppet.list << EOF
deb-src https://apt.puppet.com jessie main
deb-src https://apt.puppet.com jessie dependencies
EOF

apt-get update -y

mkdir temp && cd temp
for pkg in facter hiera ruby-rgen
do
    apt-get -y build-dep $pkg
    apt-get -b source $pkg
done

apt-get install virt-what ruby-json
apt-get install virt-what ruby-json
dpkg -i facter_*.deb hiera_*.deb ruby-rgen_*.deb
apt-get -y build-dep puppet
apt-get -b source puppet
apt-get install -y augeas-lenses libaugeas0 libaugeas-ruby1.8 ruby-shadow libshadow-ruby1.8
dpkg -i puppet-common_*.deb puppet_*.deb
