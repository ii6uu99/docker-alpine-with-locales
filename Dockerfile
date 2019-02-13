FROM python:2.7-alpine3.6

RUN apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-bin-2.29-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-i18n-2.29-r0.apk && \
    apk add --update glibc-bin-2.29-r0.apk glibc-i18n-2.29-r0.apk glibc-2.29-r0.apk && \
    pip install -U pip==19.0.2

RUN /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    /usr/glibc-compat/bin/localedef -i pt_BR -f UTF-8 pt_BR.UTF-8

ENV LANG=pt_BR.UTF-8 \
    LANGUAGE=pt_BR.UTF-8 \
    LC_CTYPE=pt_BR.UTF-8 \
    LC_NUMERIC=pt_BR.UTF-8
