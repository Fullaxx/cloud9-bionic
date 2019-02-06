# A Cloud9 docker image based on Ubuntu 18.04 (Bionic)

## Base Docker Image
Ubuntu 18.04

## Get the image

Download an automated build from the public Docker Hub Registry:

    docker pull fullaxx/cloud9-bionic

## Usage

    docker run -d -p 80:80 fullaxx/cloud9-bionic-docker

You can add a workspace as a volume directory with the argument *-v /your-path/c9ws/:/c9ws/* like this :

    docker run -d -p 80:80 -v /your-path/c9ws/:/c9ws/ fullaxx/cloud9-bionic
