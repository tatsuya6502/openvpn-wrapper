#
# Copyright 2013, Tatsuya Kawano
#
# All rights reserved - Do Not Redistribute
#

# Listen IP
default["openvpn"]["local"]   = "0.0.0.0"
default["openvpn"]["proto"]   = "udp"
default["openvpn"]["port"]    = "1194"
default["openvpn"]["type"]    = "server"
default["openvpn"]["subnet"]  = "10.8.0.0"
default["openvpn"]["netmask"] = "255.255.0.0"

# Endpoint
default["openvpn"]["gateway"] = "54.238.48.61"
default["openvpn"]["log"]     = "/var/log/openvpn.log"
default["openvpn"]["key_dir"] = "/etc/openvpn/keys"
default["openvpn"]["signing_ca_key"]  = "#{node["openvpn"]["key_dir"]}/ca.key"
default["openvpn"]["signing_ca_cert"] = "#{node["openvpn"]["key_dir"]}/ca.crt"
default["openvpn"]["routes"] = [
                                "push route 10.0.0.0 255.255.0.0",
                                "push \"dhcp-option DNS 172.16.0.23\"",
                                "push \"redirect-gateway def1\""
                               ]
default["openvpn"]["script_security"] = 1
default["openvpn"]["user"] = "nobody"
case platform
when "redhat", "centos", "fedora", "amazon"
  default["openvpn"]["group"] = "nobody"
else
  default["openvpn"]["group"] = "nogroup"
end
# Used by helper library to generate certificates/keys
default["openvpn"]["key"]["ca_expire"] = 3650
default["openvpn"]["key"]["expire"]    = 3650
default["openvpn"]["key"]["size"]      = 1024
default["openvpn"]["key"]["country"]   = "JP"
default["openvpn"]["key"]["province"]  = "Tokyo"
default["openvpn"]["key"]["city"]      = "Shibuya"
default["openvpn"]["key"]["org"]       = "snowcocoa.info"
default["openvpn"]["key"]["email"]     = "tatsuya6502@gmail.com"
