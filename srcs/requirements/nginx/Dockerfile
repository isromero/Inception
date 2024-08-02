FROM debian:buster

# Install necessary packages and create SSL certificate
RUN apt-get update && apt-get install -y \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/ssl && chmod 700 /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -sha256 -x509 -nodes -days 365 \
    -subj "/C=ES/O=42/L=Madrid/CN=Inception" \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt && \
    mkdir -p /run/nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
