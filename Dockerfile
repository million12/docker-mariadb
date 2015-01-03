FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

COPY mariadb.repo /etc/yum.repos.d/

RUN \
    yum update -y && \
    yum install -y epel-release && \
    yum install -y MariaDB-server hostname pwgen && \
    yum clean all && \
    rm -rf /var/lib/mysql/* && \
    mysql_install_db  --user=mysql

ADD create_mariadb_admin_user.sh /create_mariadb_admin_user.sh
ADD run.sh /run.sh
ADD my.cnf /etc/my.cnf
RUN chmod 775 /*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

#Added to avoid in container connection to the database with mysql client error message "TERM environment variable not set"
ENV TERM dumb

EXPOSE 3306
CMD ["/run.sh"]