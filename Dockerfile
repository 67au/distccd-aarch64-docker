FROM archlinux:base-devel

RUN set -ex \
  pacman -Syu --noconfirm distcc aarch64-linux-gnu-gcc aarch64-linux-gnu-binutils

EXPOSE 3636/tcp

ENTRYPOINT ["/usr/bin/distccd", "--verbose", "--log-stderr", "--daemon", "--no-detach", "--allow", "0.0.0.0/0"]
