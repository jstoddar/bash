#!/bin/bash
# jstoddar at g mail .com
# bash script/lib to get fc parameters
# untested in this context..., may sicken your dog...
# should work on rpm based distros versions 5, and 6

getFCinfo(){
local_WWNs="$(sed "{s/^0x//
 s/..\B/&:/g}" /sys/class/fc_host/host[0-9]/port_name)"
remote_WWNs="$(sed "{s/^0x//
 s/..\B/&:/g}" /sys/class/fc_remote_ports/rport-*/port_name \
  2>/dev/null|sort|uniq)"
hba_name="$(cat /sys/class/fc_host/host*/symbolic_name)"
}

getFCinfo
echo local www numbers: "$local_WWNs
"
echo remote www numbers: "$remote_WWNs
"
echo local hba information: "$hba_name
"

