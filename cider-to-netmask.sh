#!/bin/bash
# jstoddar at g mail .com
# bash script/lib to translate cidr notation to dotted quad.
# sets variable net_mask
# To be used primarily as lib by doing:
# either  ". <script>"  or  "source <script>"
# There are other "cooler" ways to do this however this is nice to have
#  for reference.

getDottedQuadNetmaskFromCidr(){
case $1 in
# cidr dottedQuadNetmask          # of usable IPs
  /32) net_mask=255.255.255.255;; # 1
  /31) net_mask=255.255.255.254;; # 0
  /30) net_mask=255.255.255.252;; # 2
  /29) net_mask=255.255.255.248;; # 6
  /28) net_mask=255.255.255.240;; # 14
  /27) net_mask=255.255.255.224;; # 30
  /26) net_mask=255.255.255.192;; # 62
  /25) net_mask=255.255.255.128;; # 126
  /24) net_mask=255.255.255.0;;   # 254
  /23) net_mask=255.255.254.0;;   # 510
  /22) net_mask=255.255.252.0;;   # 1022
  /21) net_mask=255.255.248.0;;   # 2046
  /20) net_mask=255.255.240.0;;   # 4094
  /19) net_mask=255.255.224.0;;   # 8190
  /18) net_mask=255.255.192.0;;   # 16382
  /17) net_mask=255.255.128.0;;   # 32766
  /16) net_mask=255.255.0.0;;
  /15) net_mask=255.254.0.0;;
  /14) net_mask=255.252.0.0;;
  /13) net_mask=255.248.0.0;;
  /12) net_mask=255.240.0.0;;
  /11) net_mask=255.224.0.0;;
  /10) net_mask=255.192.0.0;;
  /9)  net_mask=255.128.0.0;;
  /8)  net_mask=255.0.0.0;;
  /7)  net_mask=254.0.0.0;;
  /6)  net_mask=252.0.0.0;;
  /5)  net_mask=248.0.0.0;;
  /4)  net_mask=240.0.0.0;;
  /3)  net_mask=224.0.0.0;;
  /2)  net_mask=192.0.0.0;;
  /1)  net_mask=128.0.0.0;;
   *)  echo Error getting dotted quad netmask from input ${1}...
       exit 1;;
esac
}

deBug(){
 for i in $(seq 1 32) a; do
   getDottedQuadNetmaskFromCidr /$i
   echo $net_mask
 done
}

# Uncomment deBug below to debug
#@ debug


