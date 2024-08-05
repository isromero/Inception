FROM alpine:3.20

RUN apk update && apk add --no-cache vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/setup_vsftpd.sh /tmp/setup_vsftpd.sh
RUN chmod +x /tmp/setup_vsftpd.sh

EXPOSE 21 21100-21110

ENTRYPOINT ["/tmp/setup_vsftpd.sh"]

CMD ["vsftpd", "/etc/vsftpd.conf"]