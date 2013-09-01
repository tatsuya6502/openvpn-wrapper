#
# Cookbook Name:: openvpn-wrapper
# Recipe:: default
#
# Copyright 2013, Tatsuya Kawano
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "redhat", "centos", "fedora"
  include_recipe 'yum::epel'
end
include_recipe "openvpn::default"
include_recipe "openvpn::users"

case node[:platform]
when "redhat", "centos", "fedora", "amazon"
  execute "iptables -t nat -A POSTROUTING -s #{node["openvpn"]["subnet"]}/#{node["openvpn"]["netmask"]} -o eth0 -j MASQUERADE" do
    action :run
  end

  execute "/etc/rc.d/init.d/iptables save" do
    action :run
  end
end
