#!/bin/sh

echo —————— Network:——————

# Change this to en0 for an ethernet connection instead of airport
INTF=en0

# get the current number of bytes in and bytes out
sample1=(`/usr/sbin/netstat -bI $INTF | awk "/$INTF/"'{print $7" "$10; exit}'`)

# wait one second
sleep 1

# get the number of bytes in and out one second later
sample2=(`/usr/sbin/netstat -bI $INTF | awk "/$INTF/"'{print $7" "$10; exit}'`)

# find the difference between bytes in and out during that one second
# and convert bytes to kilobytes
results=(`echo "2k ${sample2[0]} ${sample1[0]} - 1024 / p" "${sample2[1]} ${sample1[1]} - 1024 / p" | dc`)

# print the results
printf "In: %.2f Kb/sec\nOut: %.2f Kb/sec\n" ${results[0]} ${results[1]}
