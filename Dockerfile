FROM searxng/searxng:latest

# Switch to root to set permissions
USER root

# Copy custom settings
COPY settings.yml /etc/searxng/settings.yml

# Fix ownership and permissions
RUN chown -R searxng:searxng /etc/searxng

# Switch back to searxng user
USER searxng

# Expose port
EXPOSE 8080

# Start SearXNG
CMD ["/usr/local/searxng/dockerfiles/docker-entrypoint.sh"]
