#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
cd /home/nathan/docker/localmovies/localmovies
docker-compose pull localmovies && docker-compose up -d
