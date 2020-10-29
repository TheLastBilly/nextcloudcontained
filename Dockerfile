FROM nginx:alpine

LABEL maintainer="Jose Ricardo jtmonegro@gmail.com"

ENV NEXTCLOUD_VERSION=20.0.0

RUN apk add \
        unzip \
        wget \
        php7-fpm \
        php7-json \
        php7-cli \
        php7-cgi \
        php7-xml \
        php7 \
        php7-gd \
        php7-curl \
        php7-zip \
        php7-mbstring \
        nextcloud-mysql \
        mariadb \
        mariadb-client \
        openssl

COPY ./settings.csr /settings.csr
COPY ./gen_certs.sh /gen_certs.sh

COPY ./install_nextcloud.sh /install_nextcloud.sh
RUN sh /install_nextcloud.sh

RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN addgroup --gid 3000 --system php
RUN adduser --uid 3000 --system --disabled-password php
RUN mkdir /var/run/php/
COPY ./www.conf /etc/php7/php-fpm.d/www.conf

COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh