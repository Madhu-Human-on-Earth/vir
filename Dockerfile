# Dockerfile - coturn for Railway
FROM instrumentisto/coturn:latest

# install envsubst (from gettext) if not present (some images already have it)
USER root
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

COPY turnserver.conf /etc/turnserver.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3478/tcp
EXPOSE 5349/tcp

ENTRYPOINT ["/entrypoint.sh"]
