# Use a small coturn image
FROM instrumentisto/coturn:latest

# Copy config into container
COPY turnserver.conf /etc/turnserver.conf

# Expose TCP ports (Railway will map them)
EXPOSE 3478/tcp
EXPOSE 5349/tcp

# Start coturn in foreground using config
CMD ["turnserver", "-c", "/etc/turnserver.conf", "--no-daemon"]
