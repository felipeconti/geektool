#!/bin/bash
	 
json=`curl -sH "Authorization: Bearer TOTVS" http://thfservices.totvs.com.br/totvsair/smartnode-view-api/now | /usr/local/bin/jq '.hits.total'`

echo "Mall: ${json}"
