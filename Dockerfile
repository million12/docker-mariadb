FROM alpine:latest

# Set TERM env to avoid mysql client error message "TERM environment variable not set" when running from inside the container
ENV TERM=xterm \
    MARIADB_VERSION=10.1

RUN \
    apk --no-cache add mariadb~${MARIADB_VERSION} mariadb-client net-tools pwgen curl bash; \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*; \
    rm -rf /var/lib/mysql/* /etc/mysql/; \
    curl -sSL http://mysqltuner.pl/ -o mysqltuner.pl

# Copy only files required for the following RUN commands (leverage Docker caching)
COPY container-files /

EXPOSE 3306

CMD ["/run.sh"]
