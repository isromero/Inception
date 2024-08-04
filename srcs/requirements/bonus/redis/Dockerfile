FROM debian:buster

RUN apt-get update && apt-get install -y \
    redis \
    php7.3-redis && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6379

COPY ./tools/setup_redis.sh /tmp/
RUN chmod +x /tmp/setup_redis.sh

CMD ["bash", "/tmp/setup_redis.sh"]