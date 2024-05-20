FROM mssql/tools

USER root

COPY initdata.sql /

ENTRYPOINT [ "bash", "-c", "sleep 10 && sqlcmd -i initdata.sql"] 