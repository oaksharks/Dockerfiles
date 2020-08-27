FROM ubuntu:16.04
USER root
ENV LANG C.UTF-8

RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse \n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" > /etc/apt/sources.list

RUN mkdir /root/.pip && echo "[global]\n\
index-url = https://pypi.doubanio.com/simple\n\
[install]\n\
trusted-host=pypi.doubanio.com" > /root/.pip/pip.conf

RUN apt-get update

RUN apt-get install -y gcc g++ make xz-utils openssl libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev language-pack-zh-hans wget

# Compile python
RUN cd /tmp && wget http://npm.taobao.org/mirrors/python/3.6.1/Python-3.6.1.tar.xz

RUN tar xf /tmp/Python-3.6.1.tar.xz -C /tmp \
    && cd /tmp/Python-3.6.1 \
    && ./configure --with-ssl --prefix=/usr/local/python3.6 \
    && make \
    && make install \
    && ln -s /usr/local/python3.6/bin/python3.6 /bin/python3.6 \
    && ln -s /usr/local/python3.6/bin/python3.6 /usr/local/bin/python3.6 \
    && ln -s /usr/local/python3.6/bin/python3.6 /bin/python3 \
    && ln -s /usr/local/python3.6/bin/pip3 /bin/pip3 \
    && ln -s /usr/local/python3.6/bin/pip3 /usr/local/bin/pip3 \
    && ln -s /usr/local/python3.6/bin/pip3.6 /bin/pip3.6

RUN pip3 install --upgrade pip

RUN apt-get install -y vim git iputils-ping curl zip unzip dnsutils python-pip openjdk-8-jdk

RUN pip install --upgrade pip

# oaksharks/ubuntu:16.04
