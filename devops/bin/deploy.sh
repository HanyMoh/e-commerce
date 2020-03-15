#!/bin/bash
set -e

COLOR='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${COLOR}== $0 ==${NC}"

VERSION=`head -n 1  ./VERSION`
BRANCH=`echo $CI_COMMIT_REF_NAME | cut -d "-" -f 1`
REGISTRY_BUILD="$CI_REGISTRY"/nasorgeg/nasnav
IMAGE_BUILD_FQN=$REGISTRY_BUILD:$VERSION-$BRANCH

rm -rf ~/.docker

echo -e "${COLOR}-> Logging to registry ${CI_REGISTRY}${NC}"
echo $CI_DEPLOY_PASSWORD | docker login -u $CI_DEPLOY_USER --password-stdin "$CI_REGISTRY"

case "$BRANCH" in
  master)
    ENV="PROD"
    DOCKER_TLSCACERT=$PROD_DOCKER_TLSCACERT
    DOCKER_TLSCERT=$PROD_DOCKER_TLSCERT
    DOCKER_TLSKEY=$PROD_DOCKER_TLSKEY
    NASNAV_HOST="master.nasnav.com,www.nasnav.com"
    ;;
  *)
    ENV="QA"
    DOCKER_TLSCACERT=$QA_DOCKER_TLSCACERT
    DOCKER_TLSCERT=$QA_DOCKER_TLSCERT
    DOCKER_TLSKEY=$QA_DOCKER_TLSKEY
    NASNAV_HOST="develop.nasnav.com"
    ;;
esac

echo -e "${COLOR}-> Environment detected: ${ENV}${NC}"

mkdir -p ~/.docker
echo "$DOCKER_TLSCACERT" > ~/.docker/ca.pem
echo "$DOCKER_TLSCERT" > ~/.docker/cert.pem
echo "$DOCKER_TLSKEY" > ~/.docker/key.pem

echo -e "${COLOR}-> Deploying stack ${IMAGE_BUILD_FQN}${NC}"

NASNAV_VERSION=$VERSION-$BRANCH NASNAV_HOST=$NASNAV_HOST SENTRY_CURRENT_ENV=$CI_ENVIRONMENT_SLUG DOCKER_TLS_VERIFY=1 DOCKER_HOST=$SWARM_MANAGER docker stack deploy \
  --with-registry-auth \
  --compose-file=docker-stack.yml \
  ${SERVICE_NAME}

docker logout ${CI_REGISTRY}
rm -rf ~/.docker
