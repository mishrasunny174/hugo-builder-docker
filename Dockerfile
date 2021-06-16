FROM ubuntu:latest

LABEL authors=mail@mishrasunny174.tech

ENV GIT_SUBMODULE_STRATEGY=recursive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y golang git

RUN mkdir $HOME/src &&\
  cd $HOME/src &&\
  git clone https://github.com/gohugoio/hugo.git &&\
  cd hugo &&\
  CGO_ENABLED=1 go install --tags extended

RUN mkdir -p /src
WORKDIR /src
