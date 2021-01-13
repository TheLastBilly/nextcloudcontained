#!/bin/sh

export NEXTCLOUD_DIRECTORY=/nextcloud/$NEXTCLOUD_VERSION/nextcloud

cd /

if [ ! -d /installations/"$NEXTCLOUD_VERSION"/nextcloud ]; then
    /install_nextcloud.sh
fi

cp -r /installations/"$NEXTCLOUD_VERSION"/nextcloud/* /nextcloud/

usermod -u $UID nginx
groupmod -g $GID www-data

chown nginx:www-data -R /nextcloud/

php-fpm7 -D
nginx -g "daemon off;"