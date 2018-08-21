echo —————Disk:——————

df -hl | grep 'disk1s1' | awk '{print $4" / "$2" free ("$5" used)"}'
