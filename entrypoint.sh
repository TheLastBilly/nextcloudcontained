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

usermod -u $UID nginx
groupmod -g $GID www-data

find / -group $DEFAULT_GID -exec chgrp -h www-data {} \;
find / -user $DEFAULT_UID -exec chown -h nginx {} \;

chown nginx:www-data -R /nextcloud/data/
chown nginx:www-data -R /nextcloud/config/

php-fpm7 -D
nginx -g "daemon off;"