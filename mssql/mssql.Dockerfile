FROM mcr.microsoft.com/mssql/server:2022-latest

ARG SA_PASSWORD

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=$SA_PASSWORD

USER root

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]