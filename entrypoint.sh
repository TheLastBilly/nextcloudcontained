#!/bin/sh

export NEXTCLOUD_DIRECTORY=/nextcloud/$NEXTCLOUD_VERSION/nextcloud

cd /

if [ ! -f /nextcloud/index.php ]; then
    /install_nextcloud.sh
fi

if [ -f /certs/recreate ]; then
    sh /gen_certs.sh
    cat cert.crt > /certs/cert.crt
    cat cert.key > /certs/cert.key
    rm cert.key cert.crt
    mv /certs/recreate /certs/recreate.done
fi

usermod -u $UID nginx
groupmod -g $GID www-data

chown nginx:www-data /nextcloud/

php-fpm7 -D
nginx -g "daemon off;"