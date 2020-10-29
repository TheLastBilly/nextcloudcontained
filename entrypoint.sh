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

chown nginx:www-data -R /nextcloud/

php-fpm7 -D
nginx -g "daemon off;"