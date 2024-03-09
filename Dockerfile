FROM archlinux:base-devel

RUN pacman -Syu --noconfirm distcc aarch64-linux-gnu-gcc aarch64-linux-gnu-binutils ccache

RUN echo "/usr/lib/ccache/bin/g++\n/usr/lib/ccache/bin/gcc\n/usr/lib/ccache/bin/c++\n/usr/lib/ccache/bin/cc" >> /CMD_LIST

EXPOSE 3632/tcp

ENV DISTCC_CMDLIST=/CMD_LIST

CMD ["/usr/bin/distccd", "--verbose", "--log-stderr", "--daemon", "--no-detach", "--allow", "0.0.0.0/0"]
