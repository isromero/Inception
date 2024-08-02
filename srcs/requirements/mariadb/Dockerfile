FROM debian:buster

# Install MariaDB and create necessary directories
RUN apt-get update && apt-get install -y \
    mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    chmod -R 755 /var/lib/mysql /var/run/mysqld

# Copy MariaDB configuration
COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/run_db.sh /tmp/
RUN chmod +x /tmp/run_db.sh

# Initialize database and create user and database
ENTRYPOINT ["/tmp/run_db.sh"]

# Run MariaDB in the foreground
CMD ["mysqld_safe"]
