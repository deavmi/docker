# TODO: Pin to a specific version as per recommendations
FROM caddy:latest

# Copy over configuration file
COPY Caddyfile /etc/caddy/Caddyfile

# Copy over landing page
RUN mkdir /data
COPY index.html /data
