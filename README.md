# NextcloudContained
A [Nextcloud](https://nextcloud.com/) docker image for the lazy.

## Setup
- Clone the [NextcloudContained](https://github.com/TheLastBilly/nextcloudcontained) repository into your computer and `cd` into it.

- Edit **variables.env** with your settings:
    - `NEXTCLOUD_VERSION`: Nextcloud version. It's "optional", but it points to 20.0.1 by default, so you may want to set it to a newer version.
    - `MYSQL_ROOT_PASSWORD`: Password for Nextcloud's database
    - `MYSQL_PASSWORD`: Password for Nextcloud's database (should be the same as the one in `MYSQL_ROOT_PASSWORD`)
    - `MYSQL_DATABASE`: Name of the database for nextcloud. Leave this as is if you don't know what you're doing.
    - `MYSQL_USER`: Username for Nextcloud's database. Leave this as is if you don't know what you're doing.
    - `UID`: UID for the nextcloud process.
    - `GID`: GID for the nextcloud process.

    ***Note:*** *Make sure you use a secure password for the database, it will work with the default one, but you know... don't*

- Edit the port number for the Nextcloud installation. This will determine the url for the instance. (i.e: https://localhost:8080, would be the default one)
***Note:*** ***DO NOT*** *change the `:80` part of the ports section, this is required for the image to work.*

- Comment out `build: .` for `#build: .`, just so you don't build the image all over again.

- Start the container using the following command:
    ```bash
    docker-compose up -d
    ```
    You should now be able to access Nextcloud from `http://[your host]:[port from docker-compose.yml]`

- In the container setup, use the following settings:
    - `Username`: Username for your admin account
    - `Password`: Password for your admin account
    - `Database user`: Value of `MYSQL_USER`
    - `Database password`: Value of `MYSQL_PASSWORD`
    - `Database name`: Value of `MYSQL_DATABASE`
    - `Database host`: `db:3306`