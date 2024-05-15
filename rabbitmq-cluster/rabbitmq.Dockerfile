FROM rabbitmq:management

COPY cluster-entrypoint.sh /usr/local/bin/
COPY allow_guest.conf /etc/rabbitmq/conf.d/

ENTRYPOINT ["cluster-entrypoint.sh"]