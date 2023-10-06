#!/bin/bash

# to list containers not running
# 
# docker ps -a | grep Exit
#
# removes EVERY CONTAINER not running
for CO in $(docker ps -a | grep Exit | awk '{print $1}'); do docker rm $CO; done

# to list images run: 
#
# docker images | awk '{print $3}'| grep -v IMAG
#
# removes EVERY IMAGES downloaded or locally created
for IMG in $(docker images | awk '{print $3}'| grep -v IMAG);  do docker rmi -f $IMG; done
 
# prunes EVERY VOLUME not used by at least one container
# to list volumes prior to prune run: 
#                                      docker volume ls 
docker volume prune --force
