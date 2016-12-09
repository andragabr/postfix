FROM debian

MAINTAINER Camille Meulien <camille.meulien@gmail.com>

RUN apt-get update \
    && apt-get install -y postfix wget

ARG KAIGARA_VERSION=v0.0.2
RUN wget --quiet https://github.com/mod/kaigara/releases/download/${KAIGARA_VERSION}/kaigara-linux-amd64-${KAIGARA_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf kaigara-linux-amd64-${KAIGARA_VERSION}.tar.gz

COPY ./operations/ /opt/provision/operations/
COPY ./resources /opt/provision/resources/

COPY bin/entrypoint.sh /usr/bin/
RUN chmod 755 /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

EXPOSE 25
