docker-aosp-v5
==============

Docker image for building [Android Open Source Project (AOSP)](https://android.googlesource.com/ "Android Open Source Project (AOSP)") Lollipop (5.0) and future verions.

Note: For older versions, e.g. KitKat, please check [tedwang-tw/docker-aosp-v4](https://github.com/tedwang-tw/docker-aosp-v4 "tedwang-tw/docker-aosp-v4").

## Installation ##
Pull the image from the [docker hub](https://registry.hub.docker.com/u/tedwang/docker-aosp-v5/ "docker hub"). This is the recommended method of installation as it is easier to update image.


    docker pull tedwang/docker-aosp-v5:latest

Alternately you can build the image locally.

    git clone https://github.com/tedwang-tw/docker-aosp-v5.git
    cd docker-aosp-v5
    docker build -t tedwang/docker-aosp-v5 .
    
## Usage ##
You can launch the image using the docker command line, suppose you have prepared a folder for aosp download in the local host, e.g. ~/AOSP/,

    docker run --name='aosp-v5' -it --rm \
    -v ~/AOSP:/home/android/aosp \
    tedwang/docker-aosp-v5 \
    /bin/bash

The /home/android/aosp is the mounted point inside the container.

## Pre-Configured ##
- Ubuntu 14.04
- Default user account: name=android, password=android
- Toolchains as from [http://source.android.com/source/initializing.html](http://source.android.com/source/initializing.html)
- Repo tool as from [http://source.android.com/source/downloading.html](http://source.android.com/source/downloading.html)
 
 
## Todo ##
