# Usa Debian como base
FROM debian:buster

# Install MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

# Configure MariaDB
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod -R 755 /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

# Copy the MariaDB configuration file
COPY ./conf/my.cnf /etc/mysql/my.cnf

# Copy the script that will create the database and the user
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# Configura el contenedor para iniciar MariaDB
CMD ["mysqld_safe", "--defaults-file=/etc/mysql/my.cnf"]
