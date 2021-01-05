#!/bin/sh

export NEXTCLOUD_DIRECTORY=/nextcloud/$NEXTCLOUD_VERSION/nextcloud

cd /

if [ -f /certs/recreate ]; then
    sh /gen_certs.sh
    cat cert.crt > /certs/cert.crt
    cat cert.key > /certs/cert.key
    rm cert.key cert.crt
    mv /certs/recreate /certs/recreate.done
fi

groupadd -g $GID php
useradd -u $UID -g php php
usermod -aG www-data php

su - php

chown php:www-data -R /nextcloud/data/
chown php:www-data -R /nextcloud/config/

php-fpm7 -D
nginx -g "daemon off;"