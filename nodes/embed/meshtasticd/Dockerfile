FROM  meshtastic/meshtasticd:beta


# RUN mkdir /etc/meshtasticd
RUN ls /etc/meshtasticd -la && sleep 20

# Copy configuration across
# COPY conf.yml /config.yaml
COPY conf.yml //etc/meshtasticd/config.yaml

# Copy accross web server configuration
# COPY web.yaml /etc/meshtasticd/config.d/

# ENV MESHTASTIC_INTERNAL_PORT=1111
# CMD meshtasticd -c conf.yml
# CMD meshtasticd --port=$MESHTASTIC_INTERNAL_PORT
# CMD ["meshtasticd", "--port=$MESHTASTIC_INTERNAL_PORT"]
# CMD ["meshtasticd", "--help"]

# ENV MAC_ADDR=4a:7e:03:7a:81:e4


#CMD meshtasticd -c /config.yaml
# CMD ls -la / && sleep 10 && meshtasticd -c /config.yaml
CMD ls -la / && sleep 10 && meshtasticd
# CMD pwd && ls -la && sleep 5 && meshtasticd
