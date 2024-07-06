FROM	debian:bookworm-slim

LABEL	author="Voxel Bone Cloud" maintainer="github@voxelbone.cloud"

RUN	apt update \
	&& echo "install gnupg" \
	&& apt install --no-install-recommends gnupg dirmngr ca-certificates -y \
	&& echo "add mono gpg keys" \
	&& export GNUPGHOME=$(mktemp -d) \
	&& gpg --recv-keys --no-default-keyring --keyring /etc/apt/trusted.gpg.d/mono-keyring.gpg --keyserver keyserver.ubuntu.com 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
	&& echo "add mono repo" \
	&& echo "deb [signed-by=/etc/apt/trusted.gpg.d/mono-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list \
	&& echo "update packagelist" \
	&& apt update \
	&& echo "install mono" \
	&& apt install -y mono-complete \
	&& apt purge -y --auto-remove gnupg dirmngr
