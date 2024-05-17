FROM haproxy

ADD --chown=99:99 --chmod=660 haproxy.cfg /usr/local/etc/haproxy/
