# https://hub.docker.com/_/mongo
# https://github.com/docker-library/mongo/blob/master/7.0/Dockerfile

FROM mongo:latest

COPY init-mongo.js /docker-entrypoint-initdb.d