#!/bin/bash
CUSTOM_REPO=$1
if [ -n "$CUSTOM_REPO" ]; then
    IMAGE_PREFIX="${CUSTOM_REPO}/"
else
    IMAGE_PREFIX=""
fi
VERSION_SUFFIX="${2:--loggingpatch}"
PULSAR_IMAGE=pulsar-all

for pulsar_version in 2.6.2 2.7.0; do
    image_tag="apachepulsar/${PULSAR_IMAGE}:${pulsar_version}${VERSION_SUFFIX}"
    echo "building $image_tag"
    set -x
    docker build --build-arg PULSAR_VERSION=${pulsar_version} --build-arg PULSAR_IMAGE=${PULSAR_IMAGE} . -t "$image_tag"
    set +x
    echo "built $image_tag"
    if [ -n "$CUSTOM_REPO" ]; then
        docker tag $image_tag "${IMAGE_PREFIX}$image_tag"
        echo "pushing ${IMAGE_PREFIX}$image_tag"
        docker push "${IMAGE_PREFIX}$image_tag"
    fi
done
