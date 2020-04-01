#!/bin/bash

docker rm $(docker stop $(docker ps -a -q --filter ancestor=cmtoro0/carlos_nginx:latest --format="{{.ID}}"))
docker image rm cmtoro0/carlos_nginx:latest
docker run -d -p80:80 cmtoro0/carlos_nginx:latest
