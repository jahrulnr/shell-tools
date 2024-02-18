#!/bin/sh

varnishlog -i ReqURL -i RespStatus -i ReqMethod -I ReqHeader:Referer -I RespHeader:Date -q 'RespHeader:X-Cache eq MISS' | --dir--/processlogs.sh