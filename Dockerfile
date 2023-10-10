FROM ubuntu:22.04

USER root

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get -y install apt-utils wget pkg-config
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install \
        git gcc g++ gfortran patch make \
        liblapack-dev libblas-dev libopenmpi-dev \
        python3 python3-distutils valgrind \
        libboost-all-dev python3-pip ffmpeg vim doxygen cm-super dvipng libmodbus-dev
RUN python3 -m pip install --upgrade pip scipy numpy pandas numba matplotlib pytest sympy
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install texlive 
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get -y install texlive-publishers texlive-science texlive-fonts-extra
RUN apt-get update && apt-get upgrade -y && apt-get autoclean && apt-get autoremove
