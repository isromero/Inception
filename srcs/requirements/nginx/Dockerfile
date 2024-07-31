FROM debian:buster

RUN apt-get update && apt-get install -y nginx

# Install OpenSSL & create SSL certificate and key
RUN apt-get update && apt-get install -y openssl
RUN openssl req -newkey rsa:4096 -sha256 -x509 -nodes -days 365 \
  -subj "/C=ES/O=42/L=Madrid/CN=Inception" \
  -keyout /etc/ssl/nginx-selfsigned.key \
  -out /etc/ssl/nginx-selfsigned.crt

COPY ./conf/default /etc/nginx/sites-available/

RUN mkdir -p /run/nginx

# EXPOSE port 443 but is not necessary because it's already in docker-compose.yml, so just for information
EXPOSE 443

# "daemon off;" tells Nginx to run in the foreground and not as a daemon(background)
CMD ["nginx", "-g", "daemon off;"]