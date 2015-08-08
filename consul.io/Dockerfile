FROM debian:jessie
RUN apt-get update && apt-get install -y \
    curl \
    zip
RUN mkdir -p /usr/local/consul/data \
    mkdir -p /usr/local/consul/ui \
    && curl -SL https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip > /usr/local/consul/0.5.2_linux_amd64.zip \
    && curl -SL https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip > /usr/local/consul/0.5.2_web_ui.zip \
    && unzip -d /usr/local/consul/ /usr/local/consul/0.5.2_linux_amd64.zip \
    && unzip -d /usr/local/consul/ui /usr/local/consul/0.5.2_web_ui.zip
#COPY ./docker-entrypoint.sh /usr/local/bin/
#RUN chmod oga+x  /usr/local/bin/docker-entrypoint.sh
RUN echo '{"service": {"name": "web", "tags": ["testit"], "port": 80,"address":"192.168.64.56"}}' >/usr/local/consul/web.json
COPY consul.json /usr/local/consul/
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp 80
#ENV DNS_RESOLVES consul
#ENV DNS_PORT 8600
ENTRYPOINT ["/usr/local/consul/consul"]
CMD [""]
