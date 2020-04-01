#!/bin/bash

sudo docker rm $(docker stop $(docker ps -a -q --filter ancestor=cmtoro0/carlos_nginx:latest --format="{{.ID}}"))
sudo docker image rm cmtoro0/carlos_nginx:latest
sudo docker run -d -p80:80 cmtoro0/carlos_nginx:latest
