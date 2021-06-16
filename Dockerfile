FROM ubuntu:latest

LABEL authors=mail@mishrasunny174.tech

ENV GIT_SUBMODULE_STRATEGY=recursive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y wget tar git

RUN mkdir /tmp/downloads
RUN cd /tmp/downloads &&\
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz &&\
rm -rf /usr/local/go &&\
tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz &&\
rm -rf /tmp/downloads

RUN mkdir $HOME/src &&\
  cd $HOME/src &&\
  git clone https://github.com/gohugoio/hugo.git &&\
  cd hugo &&\
  CGO_ENABLED=1 go install --tags extended

RUN export PATH=$PATH:/usr/local/go/bin

RUN mkdir -p /src
WORKDIR /src
