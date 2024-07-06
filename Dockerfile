FROM	debian:bookworm-slim

LABEL	author="Voxel Bone Cloud" maintainer="github@voxelbone.cloud"

RUN	apt update \
	&& apt install --no-install-recommends gnupg dirmngr ca-certificates -y \
	&& export GNUPGHOME=$(mktemp -d) \
	&& gpg --recv-keys --no-default-keyring --keyring /etc/apt/trusted.gpg.d/mono-keyring.gpg --keyserver keyserver.ubuntu.com 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
	&& echo "deb [signed-by=/etc/apt/trusted.gpg.d/mono-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list \
	&& apt update \
	&& apt install -y mono-complete \
	&& apt purge -y --auto-remove gnupg dirmngr
