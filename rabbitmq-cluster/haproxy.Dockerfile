FROM haproxy:latest

COPY --chmod 600 haproxy.cfg /usr/local/etc/haproxy/