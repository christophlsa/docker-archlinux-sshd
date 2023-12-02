# docker-archlinux-sshd

This image provides an archlinux image with a running openssh server with the `rsync` command installed. Currently only the `latest` docker tag exists.

You can run the image like this (you can also use the image from the github repository: `ghcr.io/christophlsa/archlinux-sshd`):

    sudo docker run --rm -d --name sshd -p 2222:2222 -e PUBLIC_KEY="..." christophlsa/archlinux-sshd

- This image will create the user `sshuser` and when the container is started, the ssh public key will be added to the authorized_keys. The public key can be passed by adding the `PUBLIC_KEY` environment variable.
- The openssh server is bound and exposed on port `2222`.
- On each boot the container will generate the archlinux keys, update all packages, generate the openssh keys and start the openssh server.
- If you wish, you can mount any volume on the container.
- The user has sudo access - no password is required (no password is set anyway).

The image get automatically rebuild every Monday 3am UTC.

Links:
- [GitHub Repository](https://github.com/christophlsa/docker-archlinux-sshd)
- [GitHub Package Image](https://github.com/christophlsa/docker-archlinux-sshd/pkgs/container/archlinux-sshd)
- [Docker Hub Image](https://hub.docker.com/r/christophlsa/archlinux-sshd)
