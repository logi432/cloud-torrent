FROM alpine:latest

RUN set -ex \
&& apk update \
&& apk add ca-certificates \
bash \
gcc \
musl-dev \
openssl \
git \
go \
curl
RUN git clone https://github.com/logi432/cloud-torrent.git \
&& cd cloud-torrent \
&& mv go.mod go.mod.old \
&& go get -t -u -v github.com/logi432/cloud-torrent \
&& go build -v . \
&& ls -A \
&& export PORT=8080

EXPOSE 8080
ENTRYPOINT ["./main"]
