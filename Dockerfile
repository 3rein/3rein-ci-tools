FROM debian:stable-slim

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
 && apt-get install -y curl git jq make openssh-client unzip xz-utils

# fly
RUN VERSION="$(curl --silent "https://api.github.com/repos/concourse/concourse/releases" | jq -r ".[].tag_name" | sort -h | tail -1)" \
 && curl -sSL "https://github.com/concourse/concourse/releases/download/${VERSION}/fly-${VERSION:1}-linux-amd64.tgz" | tar zxf - -C "/usr/local/bin"

# gomplate
RUN VERSION="$(curl --silent "https://api.github.com/repos/hairyhenderson/gomplate/releases/latest" | jq -r ".tag_name")" \
 && curl -sSL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${VERSION}/gomplate_linux-amd64" \
 && chmod +x "/usr/local/bin/gomplate"

# yq
RUN VERSION="$(curl --silent "https://api.github.com/repos/mikefarah/yq/releases/latest" | jq -r ".tag_name")" \
 && curl -sSL -o /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/${VERSION}/yq_linux_amd64" \
 && chmod +x /usr/local/bin/yq
