#!/bin/sh

export NEXTCLOUD_DIRECTORY=/nextcloud/$NEXTCLOUD_VERSION/nextcloud

cd /

if [ ! -d /installations/"$NEXTCLOUD_VERSION"/nextcloud ]; then
    /install_nextcloud.sh
fi

usermod -u $UID nginx
groupmod -g $GID www-data

echo "Loading nextcloud installation..."
rsync -aq installations/$NEXTCLOUD_VERSION/nextcloud/ /nextcloud
cp -r /config /nextcloud/config
rm -rf /nextcloud/data
ln -s /data /nextcloud/data
echo "Done!"

echo "Applying file permissions..."
chown nginx:www-data -R /nextcloud/
echo "Done!"

echo "Nextcloud started"
php-fpm7 -D
nginx -g "daemon off;"
echo "Nextcloud terminated"
