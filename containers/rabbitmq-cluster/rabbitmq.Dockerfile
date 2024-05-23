FROM rabbitmq:management

COPY --chmod=555 cluster-entrypoint.sh /usr/local/bin/
COPY --chown=rabbitmq:rabbitmq allow_guest.conf /etc/rabbitmq/conf.d/

ENTRYPOINT ["/usr/local/bin/cluster-entrypoint.sh"]