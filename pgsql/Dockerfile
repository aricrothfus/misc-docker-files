FROM ubuntu:14.04.2
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN apt-get -y install wget
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4
RUN mkdir -p /var/local/db
RUN tar  -cf /tmp/db2.tar -C /var/lib/postgresql/9.4/main/ .
RUN tar  -xf /tmp/db2.tar -C /var/local/db/
RUN rm -rf /var/lib/postgresql/9.4/main
RUN ln -s /var/local/db /var/lib/postgresql/9.4/main
RUN chown -R postgres.postgres /var/local/db/
USER postgres
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo "listen_addresses='*'\n" >> /etc/postgresql/9.4/main/postgresql.conf
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/local/db"]
CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
