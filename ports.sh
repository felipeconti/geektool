#!/bin/bash
echo "Network Open Port:" 
lsof -i -P|grep -i listen
