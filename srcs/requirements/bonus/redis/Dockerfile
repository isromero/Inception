FROM alpine:3.20

RUN apk update && apk add --no-cache redis

EXPOSE 6379

COPY ./conf/redis.conf /etc/redis.conf

CMD ["redis-server", "/etc/redis.conf"]