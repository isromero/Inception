#!/bin/bash
set -e
set -x

# Update WP CLI
wp cli update --allow-root

# Install WP CLI
wp core download --path=/var/www/html --locale=es_ES --allow-root

# Create wp-config.php for the next installation of Wordpress
wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root

# Install Wordpress with CLI
wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root

# Create a new user
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

# Execute the CMD from Dockerfile
exec "$@"