#!/bin/sh

. versions

docker build \
  --build-arg KUBERNETES_VERSION=${KUBERNETES_VERSION} \
  --no-cache \
  --progress plain \
  --pull \
  --tag ghcr.io/rberwald/flux-tf-state-unlocker:${KUBERNETES_VERSION} \
  .

docker push ghcr.io/rberwald/flux-tf-state-unlocker:${KUBERNETES_VERSION}-1
