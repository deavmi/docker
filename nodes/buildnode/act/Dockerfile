# FROM gitea/runner:nightly-dind-rootless AS base
# FROM gitea/runner:nightly-dind-rootless AS base
# FROM docker.io/gitea/act_runner:latest
# FROM gitea/act_runner:latest-dind-rootless

# TODO: below was the first used on Sunday, then the next
# and so forth
# FROM gitea/act_runner:0.2.12-dind-rootless
# FROm gitea/docker:dind-rootless

FROm gitea/docker:dind-rootless
# FROM gitea/docker:dind



# Copy across configuration file
COPY config.yml /config.yml

# Copy across Docker daemon config
COPY docker.conf /home/rootless/.docker
