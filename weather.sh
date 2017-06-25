#Smart Weather by enochou

geolocation=`curl -s ipinfo.io`

coords=`echo $geolocation | python -c 'import json, sys; print json.load(sys.stdin)["loc"]'`

lon=${coords#*,}
lat=${coords%,*}

weather=`curl -s "http://api.openweathermap.org/data/2.5/weather?lat="$lat"&lon="$lon"&format=json&APPID=39ee99a92a0ebdc31db5a5d6092ed1cb&units=metric"`

temp=`echo $weather | python -c 'import json, sys; print json.load(sys.stdin)["main"]["temp"]'`
description=`echo $weather | python -c 'import json, sys; print json.load(sys.stdin)["weather"][0]["description"]'`

if [ "$description" = "clear sky" ]
then
	description="clear skies"
fi

temp=`printf "%.*f\n" 0 $temp`

echo $temp"°C, "$description