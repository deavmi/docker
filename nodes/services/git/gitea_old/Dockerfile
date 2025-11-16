FROM docker.gitea.com/gitea:1.24.6

# Set custom directory to /custom
ENV GITEA_CUSTOM=/custom 

# Copy logo across
COPY face.png /$GITEA_CUSTOM/public/assets/img/face.png

# Copy templates across
COPY templates/ /$GITEA_CUSTOM/templates
