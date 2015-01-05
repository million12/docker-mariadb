FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

# Copy only file(s) required for the next RUN commands (leverage Docker caching)
COPY container-files/etc/yum.repos.d/* /etc/yum.repos.d/

RUN \
    yum update -y && \
    yum install -y epel-release && \
    yum install -y MariaDB-server hostname pwgen && \
    yum clean all && \
    rm -rf /var/lib/mysql/*

# Add all remaining files to the container
COPY container-files /

# Add VOLUME to allow backup of data
VOLUME ["/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]
