FROM mcr.microsoft.com/mssql/server:2022-latest

ARG SA_PASSWORD

ENV SA_PASSWORD=$SA_PASSWORD

ADD initdata.sql /opt/mssql-scripts/000_create_db.sql

RUN ( /opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i /opt/mssql-scripts/000_create_db.sql \
    && pkill sqlservr