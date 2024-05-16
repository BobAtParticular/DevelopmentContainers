FROM haproxy

COPY -chown=haproxy:haproxy --chmod=660 haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg