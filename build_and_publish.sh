#!/bin/sh

. versions

docker build \
  --build-arg KUBERNETES_VERSION=${KUBERNETES_VERSION} \
  --no-cache \
  --progress plain \
  --pull \
  --tag rberwald/flux-tf-state-unlocker:${KUBERNETES_VERSION} \
  .

docker tag rberwald/flux-tf-state-unlocker:${KUBERNETES_VERSION} rberwald/flux-tf-state-unlocker:latest

docker push rberwald/flux-tf-state-unlocker:${KUBERNETES_VERSION}
docker push rberwald/flux-tf-state-unlocker:latest
