FROM haproxy

ADD --chown=99:99 --chmod=660 haproxy.cfg /usr/local/etc/haproxy/

#RUN chown 99:99 /usr/local/etc/haproxy/haproxy.cfg
#RUN chmod 660 /usr/local/etc/haproxy/haproxy.cfg