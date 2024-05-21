FROM mssql/tools:latest

USER root

COPY initdata.sql /

CMD /bin/bash -c /opt/mssql-tools18/bin/sqlcmd -i /initdata.sql