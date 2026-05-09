FROM docker.io/searxng/searxng:latest

# Configuration directory
ARG BASE_DIR=/etc/searxng

# Copy settings files across
COPY limiter.toml $BASE_DIR/limiter.toml
COPY settings.yml $BASE_DIR/settings.yml
