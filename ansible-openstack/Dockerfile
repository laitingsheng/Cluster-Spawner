FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN ln -fs /usr/share/zoneinfo/Australia/Melbourne /etc/localtime

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y locales openssh-client python-pip

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN locale-gen en_AU.utf8
RUN update-locale LANG=en_AU.utf8 LC_ALL=en_AU.utf8 LANGUAGE=en_AU.utf8

RUN pip install --upgrade openstacksdk ansible
RUN rm -rf ~/.cache
