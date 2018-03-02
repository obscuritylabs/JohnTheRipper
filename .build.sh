#!/usr/bin/env bash
set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=obscuritylabs
# image name
IMAGE=johntheripper

docker build -t $USERNAME/$IMAGE:latest .

# PUSH TO DOCKER HUB
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker push $USERNAME/$IMAGE:latest
echo "Docker image pushed: $USERNAME/$IMAGE:latest"
