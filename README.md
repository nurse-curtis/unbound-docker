# unbound-docker
unbound - simple recursive caching dns server

This container has default config. In case you need to override it, please mount volume with directory containing new config file (unbound.conf) under /etc/unbound.

Usage:
docker run -d --restart always --name unbound -p 53:53 -p 53:53/udp kciepluc/unbound-docker
