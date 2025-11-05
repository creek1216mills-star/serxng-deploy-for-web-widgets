FROM searxng/searxng:latest

# Copy custom settings
COPY settings.yml /etc/searxng/settings.yml

# Ensure proper permissions
USER searxng

# Expose port
EXPOSE 8080

# Start SearxNG
CMD ["/usr/local/searxng/dockerfiles/docker-entrypoint.sh"]

