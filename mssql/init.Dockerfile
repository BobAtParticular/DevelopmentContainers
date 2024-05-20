FROM mssql/tools

USER root

COPY initdata.sql /

ENTRYPOINT [ "/bin/bash", "-c", "sleep 10 && sqlcmd -i /initdata.sql"] 