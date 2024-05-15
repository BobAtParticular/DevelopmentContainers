FROM haproxy:latest

COPY --chmod=600 --chown=haproxy:haproxy haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg