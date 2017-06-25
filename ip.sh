#!/bin/bash

IP=`ifconfig | grep "inet 10." | grep -v 127.0.0.1 | awk '{print $2}'`

echo "IP: ${IP}"