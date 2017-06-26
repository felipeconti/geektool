#!/bin/bash
	 
json=`curl -b /tmp/cookie -c /tmp/cookie -sH "Authorization: Bearer TOTVS" http://thfservices.totvs.com.br/totvsair/smartnode-view-api/now | /usr/local/bin/jq '.hits.total'`

echo "Mall: ${json}"
