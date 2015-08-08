FROM debian:jessie
RUN apt-get update && apt-get install -y \
    curl \
    zip
RUN mkdir -p /usr/local/consul/data \
    && curl -SL https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip > /usr/local/consul/0.5.2_linux_amd64.zip \
    && unzip -d /usr/local/consul/ /usr/local/consul/0.5.2_linux_amd64.zip
EXPOSE 53 8400 8500 8600
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod oga+x  /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [" agent -server -bootstrap-expect 1 -data-dir /usr/local/consul/data -node=agent-one  -bind=172.17.0.47"]
