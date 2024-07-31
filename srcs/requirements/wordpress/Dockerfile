FROM debian:buster

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget tar php7.3-fpm php7.3-mysql

WORKDIR /var/www/html

RUN rm -rf *

# Install and configure WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    cp wp-config-sample.php wp-config.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Create the directory where PHP-FPM will store its pid file
RUN mkdir -p /run/php

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# Run PHP-FPM in the foreground
CMD ["php-fpm7.3", "-F"]