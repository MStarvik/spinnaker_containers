#/bin/sh
DOCKER_EXEC=podman
SPINNAKER_VERSION=4.2.0.21

# DISTRO=focal
# BASE_IMAGE=docker.io/library/ubuntu:$DISTRO
# IMAGE_NAME=spinnaker

DISTRO=noetic
BASE_IMAGE=docker.io/library/ros:$DISTRO
IMAGE_NAME=spinnaker-ros

$DOCKER_EXEC build \
    --file Containerfile \
    --build-arg BASE_IMAGE=$BASE_IMAGE \
    --build-arg SPINNAKER_VERSION=$SPINNAKER_VERSION \
    --tag $IMAGE_NAME:$SPINNAKER_VERSION-$DISTRO \
    --tag $IMAGE_NAME:$DISTRO \
    .
