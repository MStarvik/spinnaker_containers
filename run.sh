#/bin/sh
DOCKER_EXEC=podman
IMAGE=spinnaker:focal

$DOCKER_EXEC run \
    --rm \
    --cap-add=NET_RAW \
    --net=host \
    --gpus=all \
    --env WAYLAND_DISPLAY \
    --env XDG_RUNTIME_DIR=/tmp \
    --env QT_QPA_PLATFORM=wayland \
    --volume $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
    $IMAGE
