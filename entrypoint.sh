#!/bin/sh

export NEXTCLOUD_DIRECTORY=/nextcloud/$NEXTCLOUD_VERSION/nextcloud

cd /

if [ ! -f /nextcloud/index.php ]; then
    /install_nextcloud.sh
fi

usermod -u $UID nginx
groupmod -g $GID www-data

chown nginx:www-data -R /nextcloud/

php-fpm7 -D
nginx -g "daemon off;"