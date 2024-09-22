#!/bin/sh
set -e
set -x

# Create the necessary directory for vsftpd
mkdir -p /var/run/vsftpd/empty

# Add a user and set the password
if id $FTP_USER > /dev/null 2>&1; then
  echo "User $FTP_USER already exists"
else
adduser isromero -D -h /home/$FTP_USER/ftp $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

# Create and set permissions for FTP directory
mkdir -p /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
chmod 755 /home/$FTP_USER/ftp

exec "$@"
