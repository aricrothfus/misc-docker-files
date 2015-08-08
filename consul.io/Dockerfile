FROM debian:jessie
RUN apt-get update && apt-get install -y \
    curl
RUN mkdir -p /usr/local/consul \
        && curl -SL https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip > /usr/local/consul/\
        && unzip  /usr/local/consul/0.5.2_linux_amd64.zip
EXPOSE 8400 8500 8600
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["--help"]
