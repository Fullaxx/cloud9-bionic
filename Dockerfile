# ------------------------------------------------------------------------------
# Thanks to https://github.com/kdelfour/cloud9-docker
# Thanks to https://github.com/tghastings/cloud9-docker
# ------------------------------------------------------------------------------
# Pull base image.
FROM ubuntu:18.04
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Install base
RUN apt-get update && apt-get install -y --no-install-recommends tmux nodejs \
build-essential g++ locales curl git ca-certificates python2.7-minimal supervisor

# ------------------------------------------------------------------------------
# Configure locale so that tmux works properly
RUN sed -e 's/# en_US.UTF-8/en_US.UTF-8/' -i /etc/locale.gen
RUN locale-gen

# ------------------------------------------------------------------------------
# Install Cloud9
RUN git clone https://github.com/c9/core.git /c9
WORKDIR /c9
RUN scripts/install-sdk.sh

# ------------------------------------------------------------------------------
# Add supervisord conf
ADD supervisord.conf /etc/

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /c9ws
VOLUME /c9ws

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 80

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf"]
