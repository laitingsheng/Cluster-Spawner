FROM python:3-alpine

RUN apk add gcc
RUN rm -rf /var/cache/apk/*
RUN pip install --upgrade openstacksdk ansible
RUN rm -rf ~/.cache
