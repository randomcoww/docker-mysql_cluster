## based on mysql/mysql-server
## https://github.com/mysql/mysql-docker/blob/mysql-server/8.0/Dockerfile

FROM oraclelinux:7-slim

ENV PACKAGE_URL https://dev.mysql.com/get/Downloads/MySQL-Cluster-7.6/mysql-cluster-community-server-minimal-7.6.3-1.el7.x86_64.rpm

RUN set -x \
  \
  && yum install -y $PACKAGE_URL \
  && yum clean all \
  && rm -rf /var/tmp/* \
  && rm -rf /var/cache/yum/* \
  && rm -rf /var/run/mysqld/* \
  && mkdir -p /var/lib/mysql-cluster

COPY my.cnf /etc/my.cnf
COPY mysqld-entrypoint.sh /
COPY ndbd-entrypoint.sh /
COPY ndb_mgmd-entrypoint.sh /
COPY seeder.sh /
