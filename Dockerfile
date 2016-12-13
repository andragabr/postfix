FROM debian

MAINTAINER Camille Meulien <camille.meulien@gmail.com>

RUN apt-get update \
    && apt-get install -y postfix wget

ARG KAIGARA_VERSION=v0.0.3.1
RUN wget --quiet https://github.com/calj/kaigara/releases/download/${KAIGARA_VERSION}/kaigara -O /usr/local/bin/kaigara \
    && chmod 755 /usr/local/bin/kaigara

COPY ./operations/ /opt/kaigara/operations/
COPY ./resources/ /etc/kaigara/resources/

COPY bin/entrypoint.sh /usr/bin/
RUN chmod 755 /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

EXPOSE 25
