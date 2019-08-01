# ssl-proxy-docker

Dockerized version of https://github.com/suyashkumar/ssl-proxy

## How to run

    docker run -p 8081:8081 svenstaro/ssl-proxy -from 0.0.0.0:8081 -to host-without-ssl:80
