# Use the provided base image
FROM kong/kong-gateway:3.9.0.0

LABEL maintainer="Hendrix ml-platform@spotify.com"

# Copy the plugin binary
USER root
COPY go-hello /usr/local/bin/go-hello

USER kong
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8000 8443 8001 8444
STOPSIGNAL SIGQUIT
HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD kong health
CMD ["kong", "docker-start"]

