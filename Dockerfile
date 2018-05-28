FROM node:8.11.2-alpine

ENV PATH /root/.yarn/bin:$PATH

RUN apk update \
  && apk add curl bash binutils tar python make g++ linux-headers eudev-dev \
  && rm -rf /var/cache/apk/* \
  && touch ~/.profile \
  && curl -o- -L https://yarnpkg.com/install.sh | /bin/sh -s -- --version 1.7.0

RUN echo $'#! /bin/sh\necho $1\n' > /usr/bin/fmt && chmod +x /usr/bin/fmt

RUN curl -O http://old.openzwave.com/downloads/openzwave-1.4.0.tar.gz \
    && tar -xzvf openzwave-1.4.0.tar.gz \
    && cd openzwave-1.4.0 \
    && make && make install && ldconfig .