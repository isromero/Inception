FROM alpine:3.20

RUN apk update && apk add --no-cache nodejs npm

WORKDIR /app

COPY ./tools/* .

RUN npm install

CMD ["node", "index.js"]