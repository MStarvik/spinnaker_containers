#/bin/sh
# podman build --cap-add=NET_RAW --tag spinnaker:20.04 .
podman build --cap-add=NET_RAW --tag spinnaker-ros:noetic .
