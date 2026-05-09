# Use base loki image
# TODO: Pin down to a certain version
FROM grafana/loki

# Copy over configuration file
# RUN mkdir /etc/loki
COPY config.yaml /etc/loki/loki.yaml
USER root
RUN chown loki:loki /etc/loki/loki.yaml
USER loki
RUN ls -la /etc/loki && sleep 5
