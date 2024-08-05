#!/bin/bash
set -e
set -x

# Create the necessary directory for vsftpd
mkdir -p /var/run/vsftpd/empty

# Add a user and set the password
useradd -m -d /home/$FTP_USER/ftp $FTP_USER && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec "$@"
