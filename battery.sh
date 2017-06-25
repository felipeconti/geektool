ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{print ("System Battery: ",$10/$5 * 100,"%")}';pmset -g batt |awk '{print $4 $5 $6}'|grep ';'|sed 's/;/ /g'; osascript -e 'set a to do shell script "ioreg -w0 -l | grep Capacity"' -e "set h to word 5 of a" -e "set z to word 33 of a" -e "set b to word 38 of a" -e "set c to 1000 * b / z" -e "set d to round c" -e "set f to d / 10" -e "set q to 1000 * h / b" -e "set w to round q" -e "set j to w / 10" -e '"Battery Health: " & j &"%"' | iconv -f utf-8 -t ucs-2-internal; ioreg -w0 -l | grep "Cycle Count" | awk 'BEGIN { FS = "=" } ; {print $8}' | awk 'BEGIN { FS = "}" } ; {print $1, "Cycles"}';


#!/bin/bash
then=$(sysctl kern.boottime | awk '{print $5}' | sed "s/,//")
now=$(date +%s)
diff=$(($now-$then))

days=$(($diff/86400));
diff=$(($diff-($days*86400)))
hours=$(($diff/3600))
diff=$(($diff-($hours*3600)))
minutes=$(($diff/60))


function format {
	if [ $1 == 1 ]; then
		echo $1 ' ' $2
	else
		echo $1 ' ' $2's'
	fi
}
echo 'Uptime: '`format $days "day"` `format $hours "hour"` `format $minutes "minute"`
