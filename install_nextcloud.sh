#!/bin/sh

echo "Donwloading nextcloud..."
mkdir -p /installations/"$NEXTCLOUD_VERSION"
cd /installations/"$NEXTCLOUD_VERSION"
wget "https://download.nextcloud.com/server/releases/nextcloud-$NEXTCLOUD_VERSION.zip"
unzip -o "nextcloud-$NEXTCLOUD_VERSION.zip"
rm -rf "nextcloud-$NEXTCLOUD_VERSION.zip"

if [ -d /installations/"$NEXTCLOUD_VERSION"/data ]; then
    rm -rf /installations/"$NEXTCLOUD_VERSION"/data
fi
if [ -d /installations/"$NEXTCLOUD_VERSION"/config ]; then
    rm -rf /installations/"$NEXTCLOUD_VERSION"/config
fi

chown nginx:www-data -R /installations/"$NEXTCLOUD_VERSION"
chmod 0770 -R /installations/"$NEXTCLOUD_VERSION"
echo "Done installing $NEXTCLOUD_VERSION!"