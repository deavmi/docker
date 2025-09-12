# FROM gitea/gitea:latest
FROM codeberg.org/forgejo/forgejo:11

# Set custom directory to /custom
ENV FORGEJO_CUSTOM=/custom
# Incase I switch back
ENV GITEA_CUSTOM=/custom 

# Copy logo across
COPY face.png /$FORGEJO_CUSTOM/public/assets/img/face.png

# Copy templates across
COPY templates/ /$FORGEJO_CUSTOM/templates
