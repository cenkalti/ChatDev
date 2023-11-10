#!/bin/bash
set -euo pipefail

IMAGE=chatdev:latest
CONTAINER=chatdev
HOST_PORT=8000

docker build -t $IMAGE .
docker run -it --rm -p $HOST_PORT:8000 -e OPENAI_API_KEY=$OPENAI_API_KEY --name $CONTAINER $IMAGE
