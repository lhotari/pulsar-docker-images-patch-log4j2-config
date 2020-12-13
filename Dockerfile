ARG PULSAR_IMAGE=pulsar-all
ARG PULSAR_VERSION=2.7.0
FROM apachepulsar/${PULSAR_IMAGE}:${PULSAR_VERSION}
COPY pulsar /pulsar/bin

