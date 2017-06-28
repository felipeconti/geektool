#!/bin/bash
echo "Network Open Port:"
lsof -i -P | grep -i listen | awk '!($4="");' | awk '!($5="");' | awk '!($5="");'  | awk '!($7="");' |  column -t -s ' '
