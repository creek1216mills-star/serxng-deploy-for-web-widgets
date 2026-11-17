FROM docker.io/library/caddy:alpine AS caddy
FROM docker.io/searxng/searxng:latest

# Copy Caddy binary and config files
COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY settings.yml /etc/searxng/settings.yml

# Expose port 8080 for Render
EXPOSE 8080

# Override SearXNG's default entrypoint and start both processes
ENTRYPOINT []
CMD ["/bin/sh", "-c", "/usr/local/searxng/entrypoint.sh & caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"]
