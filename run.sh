#/bin/sh
# podman run --cap-add=NET_RAW --rm -it --net=host -e DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --gpus=all spinnaker:20.04
podman run --cap-add=NET_RAW --rm -it --net=host -e DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --gpus=all spinnaker-ros:noetic
