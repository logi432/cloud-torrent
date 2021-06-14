FROM alpine:latest

RUN set -ex \
&& apk update \
&& apk add ca-certificates \
bash \
curl \
&& curl https://i.jpillora.com/cloud-torrent! | bash

EXPOSE 3000
ENTRYPOINT ["cloud-torrent"]
