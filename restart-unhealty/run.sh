#!/bin/bash

docker ps -q -f health=unhealthy | xargs --no-run-if-empty docker restart