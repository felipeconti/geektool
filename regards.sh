#!/bin/bash
	 
	 hour=`date +"%H"`
	 day=`date +"%e" | sed -E 's/([^1]1)$/\1st/'| sed -E 's/([^1]2)$/\1nd/' |sed -E 's/([^1]3)$/\1rd/' | sed -E 's/([0-9])$/\1th/' | sed -e 's/^[ \t]*//'`
	 dayw=`date +"%A"`
	 monthyear=`date +"%B %Y"`
	 
	 time=`date +"%l:%M" | sed -e 's/^[ \t]*//'`
	 am_pm=`date +"%p"`
	 
	 username=`LOGNAME`
	 
	 if [ $hour -ge 0 -a $hour -le 6 ]
	 then
	 echo "Good night ${username[@]^},"
	 echo "		  it's now $time${am_pm,,}."
	 fi
	 
	 if [ $hour -gt 6 -a $hour -le 12 ]
	 then
	 echo "Good morning ${username[@]^},"
	 echo "		  it's now $time${am_pm,,}."
	 fi
	 
	 if [ $hour -gt 12 -a $hour -le 16 ]
	 then
	 echo "Good afternoon ${username[@]^},"
	 echo "		  it's now $time${am_pm,,}."
	 fi
	 
	 if [ $hour -gt 16 -a $hour -le 23 ]
	 then
	 echo "Good evening ${username[@]^},"
	 echo "		  it's now $time${am_pm,,}."
	 fi
	 
	 echo "Today's $dayw the $day of $monthyear."