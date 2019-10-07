FROM python:3-alpine

RUN apk add build-base openssl
RUN rm -rf /var/cache/apk/*
RUN pip install --upgrade openstacksdk ansible
RUN rm -rf ~/.cache
