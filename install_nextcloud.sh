#!/bin/sh

echo "Donwloading nextcloud..."
cd /
wget "https://download.nextcloud.com/server/releases/nextcloud-$NEXTCLOUD_VERSION.zip"
unzip "nextcloud-$NEXTCLOUD_VERSION.zip"
rm -rf "nextcloud-$NEXTCLOUD_VERSION.zip"
chown nginx:www-data -R /nextcloud/
chmod g+rw -R /nextcloud/