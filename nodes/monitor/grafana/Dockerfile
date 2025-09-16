FROM grafana/grafana-oss

# RUn whoami && sleep 10

# Get root privelegies to be able to set stuff correctly
USER root

# Copy across configuration file
COPY grafana.ini /etc/grafana/grafana.ini
# COPY grafana.ini /usr/share/grafana/conf/grafana.ini

# RUN chown grafana /etc/grafana/grafana.ini
# RUN chown grafana /usr/share/grafana/conf/grafana.ini
# RUN ls /etc/grafana  -la && sleep 9

# Copy across dashboard provisioning file
# and dashboard configurations themselves
COPY provisioning/ /etc/grafana/provisioning/
# RUN ls /etc/grafana/provisioning/dashboards/ -la && sleep 5
# RUN cat /etc/grafana/provisioning/dashboards/*.ini && sleep 5

RUN ls /etc/grafana/provisioning/ -la && sleep 5

# COPY dashboards/* /etc/grafana/dashboards

# Ensure correct ownership rights on provisioning
# files
RUN chown grafana /etc/grafana/provisioning -R -v
# RUN chown grafana /etc/grafana/dashboards -R -v

# RUN ls -la /etc/grafana && sleep 10
# RUN ls -la /etc/grafana/provisioning && sleep 10
# RUN ls -la /etc/dashboards && sleep 10
# RUN

# RUN ls /etc/grafana/provisioning -la && sleep 10
# RUN ls /etc/grafana/provisioning/dashboards -la && sleep 10

# RUN cat /usr/share/grafana/conf/defaults.ini && sleep 10
# RUN rm /usr/share/grafana/conf/defaults.ini


RUN ls /etc/grafana
# RUN  rm /etc/grafana/grafana.ini
# RUN cat /etc/grafana/grafana.ini && sleep 9

# RUN pwd && sleep 10
# RUN ls -la && sleep 10
# RUN ls conf/provisioning/dashboards -la && sleep 10
# RUN cat conf/provisioning/dashboards/sample.yaml && sleep 10
