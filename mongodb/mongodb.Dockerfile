FROM mongo:latest

COPY init-mong.js /docker-entrypoint-initdb.d