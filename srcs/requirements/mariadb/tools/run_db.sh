#!/bin/bash
set -e
set -x

# Start the MySQL daemon in the background.
/usr/sbin/mysqld &
mysql_pid=$!

# Wait for the MySQL daemon to start.
until mysqladmin ping -h"localhost" --silent; do
  echo "Waiting for MariaDB to start..."
  sleep 0.2
done

# Create the database and user.
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# Configure root access (admin)
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Tell the MySQL daemon to shutdown
mysqladmin -u root -p"$MARIADB_ROOT_PASSWORD" shutdown

# Wait for the MySQL daemon to exit.
wait $mysql_pid

# Execute the CMD from Dockerfile
exec "$@"