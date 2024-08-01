FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Configure MariaDB
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod -R 755 /var/lib/mysql && \
    mkdir -p /var/run/mysqld/ && \
    chown -R mysql:mysql /var/run/mysqld/

# Copy my.cnf for MariaDB configuration
COPY conf/my.cnf /etc/mysql/my.cnf

ADD tools/run_db.sh /tmp/
RUN chmod +x /tmp/run_db.sh

# Init DB, create user and database...
ENTRYPOINT ["/tmp/run_db.sh"]

# Run MariaDB in the foreground
CMD ["mysqld_safe"]