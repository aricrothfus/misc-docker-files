FROM debian:jessie
RUN apt-get update && apt-get install -y \
    curl \
    zip
RUN mkdir -p /usr/local/consul/data \
    && curl -SL https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip > /usr/local/consul/0.5.2_linux_amd64.zip \
    && unzip -d /usr/local/consul/ /usr/local/consul/0.5.2_linux_amd64.zip
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod oga+x  /usr/local/bin/docker-entrypoint.sh
COPY agent.json /usr/local/consul/
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
ENV DNS_RESOLVES consul
ENV DNS_PORT 8600
RUN /bin/echo "what"
ENTRYPOINT ["/usr/local/consul/consul"]
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["--help"]
