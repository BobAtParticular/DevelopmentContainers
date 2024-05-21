FROM mssql/tools:latest

USER root

COPY initdata.sql /

CMD /bin/bash -c sqlcmd -i /initdata.sql