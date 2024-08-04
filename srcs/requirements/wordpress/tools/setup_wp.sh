#!/bin/bash
set -e
set -x

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "Wordpress is already installed"
    exec "$@"
    exit 0
fi

# Update WP CLI
wp cli update --allow-root

# Install WP CLI
wp core download --path=/var/www/html --locale=es_ES --allow-root

# Create wp-config.php for the next installation of Wordpress
wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root

# BONUS: Set the WP_REDIS_HOST and WP_REDIS_PORT in wp-config.php
wp config set WP_REDIS_HOST $WORDPRESS_REDIS_HOST --allow-root
wp config set WP_REDIS_PORT $WORDPRESS_REDIS_PORT --allow-root

# Install Wordpress with CLI
wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root

# Create a new user
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

# BONUS: Install the Redis Object Cache plugin
wp plugin install redis-cache --activate --allow-root

# Change the ownership of the directory to www-data(Nginx user)
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Execute the CMD from Dockerfile
exec "$@"