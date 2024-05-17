FROM haproxy

ADD haproxy.cfg /usr/local/etc/haproxy/

RUN <<EOF
chown 99:99 /usr/local/etc/haproxy/haproxy.cfg
chmod 660 /usr/local/etc/haproxy/haproxy.cfg
EOF