FROM ubuntu:latest

# Install Python, pip, Git, and required build dependencies for PyYAML
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-distutils \
    python3-setuptools \
    python3-dev \
    build-essential \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install PyYAML cleanly
RUN python3 -m pip install --upgrade pip && \
    pip3 install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py 

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
