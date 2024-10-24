FROM nvcr.io/hpc/gromacs:2023.2

ARG DEBIAN_FRONTEND=noninteractive

## grab an OpenMM installation
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config \
    git-all \
    wget \
    libbz2-dev \
    zlib1g-dev \
    python3-dev \
    libffi-dev && \
    mkdir /GW_Python && \
    cd /GW_Python && \
    wget http://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz && \
    tar -zxvf Python-3.8.10.tgz && \
    cd Python-3.8.10 && \
    ./configure --prefix=/GW_Python && \ 
    cd /GW_Python/Python-3.8.10 && \
    make && \
    make install && \
    /GW_Python/bin/pip3 install "napari[all]" && \ 
    wget https://github.com/Nanostring-Biostats/CosMx-Analysis-Scratch-Space/raw/refs/heads/Main/assets/napari-cosmx%20releases/napari_CosMx-0.4.17.0-py3-none-any.whl && \
    /GW_Python/bin/pip3 install napari_CosMx-0.4.17.0-py3-none-any.whl && \
    /GW_Python/bin/pip3 freeze | grep "napari_CosMx"
    #/GW_Python/bin/pip3 install torch torchvision torchaudio && \
