FROM archlinux:latest

ADD entrypoint.sh /entrypoint.sh

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm openssh rsync sudo && \
    pacman -Sc --noconfirm && \
    useradd -m sshuser && \
    mkdir /home/sshuser/.ssh && \
    echo "sshuser ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

CMD ["/entrypoint.sh"]
EXPOSE 2222
ENV PUBLIC_KEY ""