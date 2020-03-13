FROM debian:stable-slim

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
 && apt-get install -y curl jq wget

RUN VERSION="$(curl --silent "https://api.github.com/repos/concourse/concourse/releases" | jq -r ".[].tag_name" | sort -h | tail -1)" \
 && wget -qO- "https://github.com/concourse/concourse/releases/download/${VERSION}/fly-${VERSION:1}-linux-amd64.tgz" | tar zxf - -C "/usr/local/bin"

RUN VERSION="$(curl --silent "https://api.github.com/repos/mikefarah/yq/releases/latest" | jq -r ".tag_name")" \
 && wget -q -O "/usr/local/bin/yq" "https://github.com/mikefarah/yq/releases/download/${VERSION}/yq_linux_amd64" \
 && chmod +x "/usr/local/bin/yq"

RUN VERSION="$(curl --silent "https://api.github.com/repos/hairyhenderson/gomplate/releases/latest" | jq -r ".tag_name")" \
 && wget -q -O "/usr/local/bin/gomplate" "https://github.com/hairyhenderson/gomplate/releases/download/${VERSION}/gomplate_linux-amd64" \
 && chmod +x "/usr/local/bin/gomplate"
