#!/bin/sh

echo "Donwloading nextcloud..."
chown $UID:$GID /installations
mkdir -p /installations/"$NEXTCLOUD_VERSION"
cd /installations/"$NEXTCLOUD_VERSION"
wget "https://download.nextcloud.com/server/releases/nextcloud-$NEXTCLOUD_VERSION.zip"
echo "Done downloading $NEXTCLOUD_VERSION!"

echo "Installing nextcloud..."
unzip -o "nextcloud-$NEXTCLOUD_VERSION.zip"
rm -rf "nextcloud-$NEXTCLOUD_VERSION.zip"
chown $UID:$GID -R /installations/"$NEXTCLOUD_VERSION"
echo "Done installing $NEXTCLOUD_VERSION!"
