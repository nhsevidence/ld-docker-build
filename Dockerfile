FROM phusion/baseimage
MAINTAINER Ryan Roberts <ryansroberts@gmail.com>

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.12.0 main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list && \
  apt-get update

RUN apt-get install -y \
    mono-complete \
    fsharp \
    libtool \
    autoconf \
    g++ \
    gettext \
    make \
    default-jdk \
    cmake \
    git \
    wget \
    htop \
    pandoc \
    haskell-platform

RUN apt-get install -y nodejs npm &&\
    npm install -g grunt &&\
    ln /usr/bin/nodejs /usr/bin/node

RUN mozroots --import --sync  &&\
    yes | certmgr --ssl -m https://go.microsoft.com &&\
    yes | certmgr -ssl -m https://nugetgallery.blob.core.windows.net &&\
    yes | certmgr -ssl -m https://nuget.org
