FROM archlinux:base-devel

RUN pacman -Syu --noconfirm distcc aarch64-linux-gnu-gcc aarch64-linux-gnu-binutils

EXPOSE 3636/tcp

CMD ["/usr/bin/distccd", "--verbose", "--log-stderr", "--daemon", "--no-detach", "--allow", "0.0.0.0/0"]
