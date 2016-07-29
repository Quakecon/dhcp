#!/bin/bash
 
SECOND_OCTET=$1
START_RANGE=$2
END_RANGE=$3

for THIRD_OCTET in `seq $START_RANGE $END_RANGE`
do
  IPX="172.$SECOND_OCTET.$THIRD_OCTET"
  echo "subnet $IPX.0 netmask 255.255.255.0 {"
  echo "  option subnet-mask 255.255.255.0;"
  echo "  option routers $IPX.1;"
  echo "  pool {"
  echo "    failover peer \"dhcp-failover\";"
  echo "    range $IPX.130 $IPX.254;"
  echo "  }"
  echo "}"
  echo ""
done
