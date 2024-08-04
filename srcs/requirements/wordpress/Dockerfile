FROM debian:buster

WORKDIR /var/www/html

# Install necessary packages
RUN apt-get update && apt-get install -y \
    php7.3-fpm \
    php7.3-mysql \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create the necessary directory for PHP-FPM
RUN mkdir -p /var/run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/setup_wp.sh /tmp/
RUN chmod +x /tmp/setup_wp.sh 

ENTRYPOINT ["/tmp/setup_wp.sh"]

# Run PHP-FPM in the foreground
CMD ["php-fpm7.3", "-F"]
