FROM mssql/tools:latest

USER root

COPY initdata.sql /

CMD /bin/bash -c sleep 10 && sqlcmd -i /initdata.sql