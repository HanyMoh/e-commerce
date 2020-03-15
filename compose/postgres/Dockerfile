FROM postgres:9.5

# RUN mkdir -p /docker-entrypoint-initdb.d
# COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

# add backup scripts
COPY backup.sh /usr/local/bin/backup
COPY restore.sh /usr/local/bin/restore
COPY list-backups.sh /usr/local/bin/list-backups

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
