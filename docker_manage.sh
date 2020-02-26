#!/usr/bin/env bash

echo " "
echo "THIS SCRIPT IS WRITEN AND TESTED FOR WINDOWS, GIT-BASH AND DOCKER-DESKTOP"
echo "-------------------------------------------------------------------------"

IMAGE_README="This argument deletes a single docker-image and container"
RESET_README="This argument resets and deletes all docker-images and containers"
RESET_ALL_README="This argument resets and deletes all docker-images, containers, volumes and MySQL data"

case "$1" in

image)
    # echo " "
    # echo "$IMAGE_README"
    # read -p "Are you sure you want to run this command ? (y/n) " ANSWEAR
    # if [ "$ANSWEAR" != "y" ]; then
    #     echo "- Script will now exit"
    #     exit
    # fi
    # echo "- Script will now continue"
    echo " "
    echo "To manualy delete docker-containers and images run bellow commands:"
    echo " "
    echo "Search for the right container id and delete:"
    echo "> docker ps"
    echo "> docker rm <container-id>"
    echo " "
    echo "Search for the right image id and delete:"
    echo "> docker image ps"
    echo "> docker image rm <image-id>"
    ;;

reset)
    echo " "
    echo "$RESET_README"
    read -p "Are you sure you want to run this command ? (y/n) " ANSWEAR
    if [ "$ANSWEAR" != "y" ]; then
        echo "- Script will now exit"
        exit
    fi
    echo "- Script will now continue"
    echo " "
    echo "command to run..."
    ;;

reset_all)
    echo " "
    echo "$RESET_ALL_README"
    read -p "Are you sure you want to run this command ? (y/n) " ANSWEAR
    if [ "$ANSWEAR" != "y" ]; then
        echo "- Script will now exit"
        exit
    fi
    echo "- Script will now continue"
    echo " "
    echo "command to run..."
    ;;

*)
    echo "Arguments: image | reset | reset_all | Example: bash docker_manage.sh reset"
    echo " "
    echo "- image: $IMAGE_README"
    echo "- reset: $RESET_README"
    echo "- reset_all: $RESET_ALL_README"
    ;;
esac
