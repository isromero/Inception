#!/bin/bash
set -e
set -x

sed -i "s|bind 127.0.0.1|bind 0.0.0.0|g" /etc/redis/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 128mb|g" /etc/redis/redis.conf

redis-server --protected-mode no