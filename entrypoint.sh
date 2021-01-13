#!/bin/sh

export NEXTCLOUD_DIRECTORY=/nextcloud/$NEXTCLOUD_VERSION/nextcloud

cd /

if [ ! -d /installations/"$NEXTCLOUD_VERSION"/nextcloud ]; then
    /install_nextcloud.sh
fi

config_opt=""
data_opt=""
if [ ! -z "$(ls -A /nextcloud/config)" ]; then
    config_opt="--exclude=config/"
fi
if [ ! -z "$(ls -A /nextcloud/data)" ]; then
    data_opt="--exclude=data/"
fi

echo "Loading nextcloud installation..."
rsync -aq /installations/"$NEXTCLOUD_VERSION"/nextcloud /nextcloud "$config_opt" "$data_opt" 
echo "Done!"

usermod -u $UID nginx
groupmod -g $GID www-data

chown nginx:www-data -R /nextcloud/

php-fpm7 -D
nginx -g "daemon off;"