#!/bin/sh

nohup docker ps -q | xargs -L 1 -P `docker ps | wc -l` docker logs --since 1s -f > --log--/container.log 2>&1