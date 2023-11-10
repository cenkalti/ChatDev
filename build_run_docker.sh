#!/bin/bash
set -euxo pipefail

IMAGE=chatdev:latest
CONTAINER=chatdev
HOST_PORT=8000
MODEL=GPT_4_TURBO
ORG=cenkalti
NAME=tic-tac-toe
TASK='tic tac toe game in browser'

docker build -t $IMAGE .
docker rm -f $CONTAINER || true
docker run \
	-it \
	-p $HOST_PORT:8000 \
	-e OPENAI_API_KEY=$OPENAI_API_KEY \
	--name $CONTAINER $IMAGE \
	--model $MODEL \
	--org $ORG \
	--name $NAME \
	--task "$TASK"
docker cp $CONTAINER:/app/WareHouse .
docker rm $CONTAINER
