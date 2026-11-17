FROM searxng/searxng:latest

# Install Caddy
RUN apk add --no-cache caddy

# Copy your custom SearXNG settings and Caddy config
COPY settings.yml /etc/searxng/settings.yml
COPY Caddyfile /etc/caddy/Caddyfile

# Run SearXNG internally on port 8888, while Caddy listens on Render's $PORT
ENV SEARXNG_BIND_ADDRESS=127.0.0.1:8888
CMD sh -c "caddy start --config /etc/caddy/Caddyfile && exec /usr/local/searxng/dockerfiles/docker-entrypoint.sh"
