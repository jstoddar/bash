#!/bin/bash
# jstoddar at g mail .com
# Bash script/lib to get current networking parameters.
# Works on rpm based distros versions 6, 7 and debian 14 LTS.
# Requires additional bash lib: cider-to-netmask.sh
# To debug or test use -v or --v as first parameter

testPrintOut(){
# Script sets the following variables listed below.
if [ "X$1" == 'X-v' ] || [ "X$1" == 'X--v' ]; then
  echo "default_route       $default_route
public_interface    $public_interface
net_work            $net_work
public_link_status  $public_link_status
hw_addr             $hw_addr
public_ip           $public_ip
cidr_netmask        $cidr_netmask
net_mask            $net_mask
host_name           $host_name"
fi
}

sourceCidrToNetmaskLib(){
# cider-to-netmask.sh uses getDottedQuadNetmaskFromCidr
#  to set variable $net_mask
# usage: getDottedQuadNetmaskFromCidr <cidr> 
# example  getDottedQuadNetmaskFromCidr /24
source cider-to-netmask.sh > /dev/null 2>&1 
if [ $? -gt 0 ] ; then
   echo "cider-to-netmask.sh lib not found...
 Aborting.
 "
   exit 1
 fi
 }

getNetworkParams(){
# Gets existing network parameters for scripting.
eval $(ip route list| awk '$1=="default"{
  print "default_route="$3
  print "public_interface="$5}')
 
eval $(ip addr show $public_interface| \
  awk -v inter_face="${public_interface}:" '{
    gsub("/"," /");
    if($2==inter_face)print "public_link_status="$9;
    if($1=="link")print "hw_addr="$3;
    if($1=="inet")print "public_ip="$2,"cidr_netmask="$3}')

eval $(ip route list src $public_ip| \
  awk '{gsub("/"," ")
    print "net_work="$1}')
}

getCheckFullyQualifiedHostname(){
# Check to make sure that the hostame obtained appears
#  fully qualified... function is also handy for checking user input.
host_name=$(hostname)
if [ "$(echo $host_name| awk -F. '{print NF}')" -lt 2 ] ; then
   echo "hostname appears to be not fully qualifed...
 Aborting."
exit 1
fi 
}

### Main
getNetworkParams
sourceCidrToNetmaskLib
getDottedQuadNetmaskFromCidr $cidr_netmask
getCheckFullyQualifiedHostname
testPrintOut $*

