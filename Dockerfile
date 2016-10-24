FROM centos:7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

# Set TERM env to avoid mysql client error message "TERM environment variable not set" when running from inside the container
ENV TERM=xterm \
    MARIADB_VERSION=10.2

# Copy only files required for the following RUN commands (leverage Docker caching)
COPY container-files /

RUN \
    sed -i "s#MARIADB_VERSION#"${MARIADB_VERSION}"#g" /etc/yum.repos.d/mariadb.repo && \
    yum update -y && \
    yum install -y epel-release && \
    yum install -y MariaDB-server hostname net-tools pwgen && \
    yum clean all && \
    rm -rf /var/lib/mysql/* && \

    `# Install mysqltuner.pl` \
    curl -sSL http://mysqltuner.pl/ -o mysqltuner.pl

EXPOSE 3306
CMD ["/run.sh"]
