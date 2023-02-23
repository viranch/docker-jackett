FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

# Install Jackett
RUN apt-get update && \
	apt-get install -y --no-install-recommends libicu66 ca-certificates curl jq; \
    JACKETT_VERSION="$(curl -s https://api.github.com/repos/Jackett/Jackett/releases | jq -r '.[0].name')"; \
    JACKETT_URL="https://github.com/Jackett/Jackett/releases/download/${JACKETT_VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz"; \
    curl -L "$JACKETT_URL" | tar -C /opt/ -zx; \
    apt-get remove -y --purge curl jq && \
	apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Finally declare public things
VOLUME /config
EXPOSE 9117

# Define how to run the image
ENV XDG_CONFIG_HOME=/config XDG_DATA_HOME=/config
CMD ["/opt/Jackett/jackett"]
