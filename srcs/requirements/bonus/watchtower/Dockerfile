FROM alpine:3.20

RUN apk update && apk add --no-cache wget \
    tar

RUN wget https://github.com/containrrr/watchtower/releases/download/v1.7.1/watchtower_linux_amd64.tar.gz && \
    tar -xvzf watchtower_linux_amd64.tar.gz && \
    mv watchtower /usr/local/bin && \
    chmod +x /usr/local/bin/watchtower

# Run watchtower every 24 hours
CMD ["watchtower", "--interval", "86400", "--cleanup"]