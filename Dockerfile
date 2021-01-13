FROM nginx:alpine

LABEL maintainer="Jose Ricardo jtmonegro@gmail.com"

ENV NEXTCLOUD_VERSION=20.0.1

RUN apk add --no-cache \
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
        rsync \
        shadow

COPY ./install_nextcloud.sh /install_nextcloud.sh
RUN mkdir /nextcloud

RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir /var/run/php/
COPY ./www.conf /etc/php7/php-fpm.d/www.conf

COPY ./entrypoint.sh /entrypoint.sh

RUN mkdir /installations
RUN mkdir /nextcloud/data
RUN mkdir /nextcloud/config

CMD /entrypoint.sh
