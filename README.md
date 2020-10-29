# NextcloudContained
A [Nextcloud](https://nextcloud.com/) docker image for the lazy.

## Setup
- Edit **variables.env** with your settings:
    - `MYSQL_ROOT_PASSWORD`: Password for Nextcloud's database
    - `MYSQL_PASSWORD`: Password for Nextcloud's database (should be the same as the one in `MYSQL_ROOT_PASSWORD`)
    - `MYSQL_DATABASE`: Name of the database for nextcloud. Leave this as is if you don't know what you're doing.
    - `MYSQL_USER`: Username for Nextcloud's database. Leave this as is if you don't know what you're doing.

    ***Note:*** *Make sure you use a secure password for the database, it will work with the default one, but you know... don't*

- Edit the port number for the Nextcloud installation. This will determine the url for the instance. (i.e: https://localhost:9100, would be the default one)
***Note:*** ***DO NOT*** *change the `:443` part of the ports section, this is required for the image to work.*

- **(Optional)** Move your ssl certificate files into the **certs** folder. Use **cert.crt** for the certificate and **cert.key** for the key file. **IMPORTANT**, make sure to delete the **recreate** file in the **certs** folder.

    If you decide not to do this step, **NextcloudContained** will create a self-signed certificate for you.

- Start the container using the following command:
    ```bash
    docker-compose up -d
    ```
    You should now be able to access Nextcloud from `https://[your host]:[port from docker-compose.yml]`

- In the container setup, use the following settings:
    - `Username`: Username for your admin account
    - `Password`: Password for your admin account
    - `Database user`: Value of `MYSQL_USER`
    - `Database password`: Value of `MYSQL_PASSWORD`
    - `Database name`: Value of `MYSQL_DATABASE`
    - `Database host`: `db:3306`