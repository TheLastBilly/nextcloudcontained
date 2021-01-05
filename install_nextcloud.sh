#!/bin/sh

echo "Donwloading nextcloud..."
cd /
wget "https://download.nextcloud.com/server/releases/nextcloud-$NEXTCLOUD_VERSION.zip"
unzip -o "nextcloud-$NEXTCLOUD_VERSION.zip"
rm -rf "nextcloud-$NEXTCLOUD_VERSION.zip"
chown nginx:www-data -R /nextcloud/
chmod 0770 -R /nextcloud/
echo "Done installing!"