#!/bin/bash
set -e

COLOR='\033[1;33m'
NC='\033[0m'

echo -e "${COLOR}== $0 ==${NC}"

REGISTRY_BUILD=registry.gitlab.com/nasorgeg/nasnav/postgres
IMAGE_BUILD_FQN=$REGISTRY_BUILD:latest

echo -e "${COLOR}-> Build image: $IMAGE_BUILD_FQN${NC}"

docker build -t $IMAGE_BUILD_FQN ./compose/postgres/

echo -e "${COLOR}-> Publish to ${REGISTRY_BUILD}${NC}"
docker login registry.gitlab.com
docker push $REGISTRY_BUILD
docker logout registry.gitlab.com
