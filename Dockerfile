FROM nginx:alpine

LABEL maintainer="Jose Ricardo jtmonegro@gmail.com"

ENV NEXTCLOUD_VERSION=20.0.1

ENV DEFAULT_UID=3000
ENV DEFAULT_GID=3000

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
        openssl \
        shadow

COPY ./settings.csr /settings.csr
COPY ./gen_certs.sh /gen_certs.sh

RUN usermod -u $DEFAULT_UID nginx
RUN groupmod -g $DEFAULT_GID www-data

COPY ./install_nextcloud.sh /install_nextcloud.sh
RUN sh /install_nextcloud.sh

RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir /var/run/php/
COPY ./www.conf /etc/php7/php-fpm.d/www.conf

COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
