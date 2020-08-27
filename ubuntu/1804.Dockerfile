FROM ubuntu:18.04
USER root
ENV LANG C.UTF-8

RUN mkdir /root/.pip && echo "[global]\n\
index-url = https://pypi.doubanio.com/simple\n\
[install]\n\
trusted-host=pypi.doubanio.com" > /root/.pip/pip.conf

RUN  sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
     && sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
     && cat /etc/apt/sources.list \
     && apt-get update \
     && apt-get install -y python3 python3-pip git language-pack-zh-hans  wget  vim git iputils-ping curl zip unzip dnsutils python-pip openjdk-8-jdk \
     && pip3 install -i https://pypi.doubanio.com/simple --no-cache-dir --upgrade pip \
     && apt-get clean

# oaksharks/ubuntu:18.04