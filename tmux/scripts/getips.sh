#!/bin/bash
ips=''
for interface in $( ifconfig -l );
do
    ip=$(ifconfig $interface | grep -E inet[^0-9] |grep -v 127.0.0.1 | cut -d' ' -f 2)
    if [ -n "$ip" ];
    then
        ips=$ips" $interface: $ip |"
    fi
done
echo $ips
