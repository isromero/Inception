FROM debian:buster

RUN apt-get update && apt-get install -y php \
    wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php && \
  chown -R www-data:www-data /var/www/html/adminer.php && \
  chmod 755 /var/www/html/adminer.php

# Serve a php built-in server for Adminer, but this is not necessary because already Wordpress is serving the file with php-fpm,
# it is only for mantain the container running, because is prohibited to use tricks like sleep infinity, tail -f /dev/null, etc.
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/"]