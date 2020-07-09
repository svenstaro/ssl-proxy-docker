FROM alpine as builder
ARG VERSION=0.2.6
RUN apk add --no-cache wget tar
RUN wget https://github.com/suyashkumar/ssl-proxy/releases/download/v${VERSION}/ssl-proxy-linux-amd64.tar.gz
RUN tar xf ssl-proxy-linux-amd64.tar.gz

FROM alpine
RUN apk update
RUN apk add wget ca-certificates bash
RUN update-ca-certificates
COPY --from=builder ssl-proxy-linux-amd64 /ssl-proxy
ENTRYPOINT ["/ssl-proxy"]
