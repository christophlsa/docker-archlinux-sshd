#!/usr/bin/env bash

echo "* Create pacman key"
pacman-key --init
echo "* Update pacman packages"
pacman -Syu --noconfirm

echo "* Add authorized SSH key"
echo "${PUBLIC_KEY}" > /home/sshuser/.ssh/authorized_keys
chown -R sshuser:sshuser /home/sshuser/.ssh

echo "* Generate sshd host keys"
/usr/bin/ssh-keygen -A

echo "* Start sshd"
exec /usr/bin/sshd -D -p 2222