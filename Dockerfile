FROM ubuntu:latest

ENV GIT_SUBMODULE_STRATEGY=recursive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y golang git

RUN mkdir $HOME/src &&\
  cd $HOME/src &&\
  git clone https://github.com/gohugoio/hugo.git &&\
  cd hugo &&\
  go install --tags extended

MAINTAINER mishrasunny174.tech
RUN mkdir -p /src
WORKDIR /src
