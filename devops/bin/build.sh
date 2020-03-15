#!/bin/bash
set -e

COLOR='\033[1;33m'
NC='\033[0m'

echo -e "${COLOR}== $0 ==${NC}"

VERSION=`head -n 1  ./VERSION`
BRANCH=`echo $CI_COMMIT_REF_NAME | cut -d "-" -f 1`
REGISTRY_BUILD="$CI_REGISTRY"/nasorgeg/nasnav
IMAGE_BUILD_FQN=$REGISTRY_BUILD:$VERSION-$BRANCH
VERSION_DEPLOYED="$VERSION-$BRANCH+$CI_PIPELINE_ID.$(date --utc +%Y%m%dT%H%M%S)"

echo -e "${COLOR}-> Build image: $IMAGE_BUILD_FQN${NC}"
echo "$VERSION_DEPLOYED" > REVISION

docker build -t $IMAGE_BUILD_FQN .
docker tag $IMAGE_BUILD_FQN $REGISTRY_BUILD:$BRANCH
[[ "$BRANCH" == "master" ]] && docker tag $IMAGE_BUILD_FQN $REGISTRY_BUILD:latest

echo -e "${COLOR}-> Publish to ${REGISTRY_BUILD}${NC}"
echo $CI_BUILD_TOKEN | docker login -u gitlab-ci-token --password-stdin "$CI_REGISTRY"
docker push $REGISTRY_BUILD
docker logout ${CI_REGISTRY}
