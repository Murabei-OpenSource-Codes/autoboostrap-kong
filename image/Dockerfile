FROM kong:3.9.0-ubuntu
LABEL maintainer="Murabei Data Science"

##############################################
# Default variable to facilitate local tests #
ENV KONG_DATABASE="postgres"
ENV KONG_PG_HOST="postgres-kong-database"
ENV KONG_PG_PORT="5432"
ENV KONG_PROXY_ACCESS_LOG="/dev/stdout"
ENV KONG_ADMIN_ACCESS_LOG="/dev/stdout"
ENV KONG_PROXY_ERROR_LOG="/dev/stderr"
ENV KONG_ADMIN_ERROR_LOG="/dev/stderr"
ENV KONG_ADMIN_LISTEN="0.0.0.0:8001, 0.0.0.0:8444 ssl"
ENV KONG_PG_PASSWORD="kong"
ENV KONG_PG_USER="kong"

# Installing tools for postgres readness detection
USER root
RUN apt update
RUN apt upgrade -y
RUN apt install -y postgresql-client curl

COPY resources/docker-entrypoint.sh /docker-entrypoint.sh
COPY resources/wait-for-postgres.sh /wait-for-postgres.sh
COPY resources/bootstrape-kong.sh /bootstrape-kong.sh
RUN chmod +x /docker-entrypoint.sh
RUN chmod +x /wait-for-postgres.sh
RUN chmod +x /bootstrape-kong.sh

USER kong
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 8000 8443 8001 8444
STOPSIGNAL SIGQUIT

CMD ["kong", "docker-start"]
