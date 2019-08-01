FROM alpine as builder
ARG VERSION=0.2.3
RUN apk add --no-cache wget tar
RUN wget https://github.com/suyashkumar/ssl-proxy/releases/download/v${VERSION}/ssl-proxy-linux-amd64-v${VERSION}.tar.gz
RUN tar xf ssl-proxy-linux-amd64-v${VERSION}.tar.gz

FROM scratch
COPY --from=builder ssl-proxy /ssl-proxy
ENTRYPOINT ["/ssl-proxy"]
