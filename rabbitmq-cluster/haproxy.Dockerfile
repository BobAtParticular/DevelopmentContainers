FROM haproxy:latest

COPY --chown 600 haproxy.cfg /usr/local/etc/haproxy/