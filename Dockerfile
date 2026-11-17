FROM docker.io/library/caddy:alpine AS caddy
FROM docker.io/searxng/searxng:latest

COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY settings.yml /etc/searxng/settings.yml
COPY limiter.toml /etc/searxng/limiter.toml

EXPOSE 8080

ENTRYPOINT []
CMD ["/bin/sh", "-c", "/usr/local/searxng/entrypoint.sh & caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"]
