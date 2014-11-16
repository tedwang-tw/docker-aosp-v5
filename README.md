docker-aosp-v5
==============

Docker image for building [Android Open Source Project (AOSP)](https://android.googlesource.com/ "Android Open Source Project (AOSP)") Lollipop (5.0) and future verions.

Note: For older versions, e.g. KitKat, please check [tedwang-tw/docker-aosp-v4](https://github.com/tedwang-tw/docker-aosp-v4 "tedwang-tw/docker-aosp-v4").

## Installation ##
Pull the image from the [Docker Hub](https://registry.hub.docker.com/u/tedwang/aosp-v5/ "Docker Hub"). This is the recommended method of installation as it is easier to update image.

    docker pull tedwang/aosp-v5:latest

Alternately you can build the image locally.

    git clone https://github.com/tedwang-tw/docker-aosp-v5.git
    cd docker-aosp-v5
    docker build -t tedwang/aosp-v5 .

Here you can swap the base image with either **tedwang/aosp-base12** or **-base14** by manually modifying "FROM" command in Dockerfile.

Note: If you'd like the original monolithic build, you can clone by the branch "monolithic":

    git clone https://github.com/tedwang-tw/docker-aosp-v5.git -b monolithic
    cd docker-aosp-v5
    docker build -t tedwang/aosp-v5:monolithic .

## Usage ##
You can launch the image using the docker command line, suppose you have prepared a folder for aosp download at the local host, e.g. **~/AOSP**,

    docker run --name='aosp-v5' -it --rm \
    -v ~/AOSP:/home/android/aosp \
    tedwang/aosp-v5 \
    /bin/bash

The **/home/android/aosp** is the mounted point inside the container.

Once entering the container, you can operate as the normal developing:

    0 android@ ~ $ cd aosp
    0 android@ ~/aosp $ git config --global user.email "name@example.com"
    0 android@ ~/aosp $ git config --global user.name "My Name"
    0 android@ ~/aosp $ repo init -u https://android.googlesource.com/platform/manifest
    0 android@ ~/aosp $ repo sync
    0 android@ ~/aosp $ source build/envsetup.sh
    0 android@ ~/aosp $ lunch ......

## Pre-Configured ##
- Ubuntu 14.04
- Default user account: name=**android**, password=**android**
- Toolchains as from [http://source.android.com/source/initializing.html](http://source.android.com/source/initializing.html)
- Repo tool as from [http://source.android.com/source/downloading.html](http://source.android.com/source/downloading.html)
 
## Todo ##
- Setup for ccache
- <del>Separate base image</del>

## ChangeLog ##
- 2014-11-15
	- Created branch "[monolithic](https://github.com/tedwang-tw/docker-aosp-v5/tree/monolithic "monolithic")" for no separated base image build
	- "[master](https://github.com/tedwang-tw/docker-aosp-v5/tree/master "master")" branch now includes the separated base image
