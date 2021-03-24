FROM debian:buster-slim
SHELL ["/bin/bash", "-uo", "pipefail", "-c"]

LABEL org.opencontainers.image.url="https://github.com/users/msrd0/packages/container/package/win-cross-qt5"
LABEL org.opencontainers.image.title="Qt5 Cross-Compiling Tools for Windows"
LABEL org.opencontainers.image.description="Qt5 Cross-Compiling Tools for Windows based on Debian and MXE"
LABEL org.opencontainers.image.source="https://github.com/msrd0/docker-win-cross-qt5"

ARG architectures="i686 x86-64"
RUN apt-get -y update && apt-get -y install --no-install-recommends \
		bzip2 \
		ca-certificates \
		dirmngr \
		git \
		grep \
		gnupg \
		make \
		sed \
		sudo \
		xz-utils \
 && echo "deb http://pkg.mxe.cc/repos/apt buster main" | tee /etc/apt/sources.list.d/mxe.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86B72ED9 \
 && apt-get -y update \
 && apt-get -y install --no-install-recommends \
		$(for arch in $architectures; do printf 'mxe-%s-w64-mingw32.static-qtbase' "$arch"; done) \
 && mkdir -p /etc/sudoers.d \
 && useradd -m -d /home/user user \
 && echo 'user ALL=(ALL) NOPASSWD:ALL' >/etc/sudoers.d/user \
 && rm -rf /var/lib/apt/lists/*
ENV PATH /usr/lib/mxe/usr/bin:$PATH

USER user
ENV HOME /home/user
WORKDIR /home/user
CMD ["/bin/bash"]
