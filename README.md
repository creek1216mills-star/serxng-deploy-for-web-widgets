# SearxNG Deployment

This repository contains a Docker setup for deploying SearxNG with JSON API support enabled.

## Features

- SearxNG metasearch engine
- JSON API format enabled (in addition to HTML)
- Docker and Docker Compose setup
- Easy to deploy and customize

## Configuration

The `settings.yml` file includes the necessary configuration to enable JSON API responses:

```yaml
search:
  formats:
    - html
    - json
```

## Quick Start

### Using Docker Compose (Recommended)

1. **Update the secret key** in `settings.yml`:
   ```yaml
   server:
     secret_key: "your_random_secret_key_here"
   ```

2. **Start the service**:
   ```bash
   docker-compose up -d
   ```

3. **Access SearxNG**:
   - Web UI: http://localhost:8080
   - JSON API: http://localhost:8080/search?q=your_query&format=json

### Using Docker

1. **Build the image**:
   ```bash
   docker build -t searxng-custom .
   ```

2. **Run the container**:
   ```bash
   docker run -d \
     -p 8080:8080 \
     -v $(pwd)/settings.yml:/etc/searxng/settings.yml:ro \
     -e SEARXNG_BASE_URL=http://localhost:8080 \
     --name searxng \
     searxng-custom
   ```

## API Usage

Once running, you can query the JSON API:

```bash
# Simple search
curl "http://localhost:8080/search?q=test&format=json"

# Search with category filter
curl "http://localhost:8080/search?q=test&format=json&categories=general"

# Search with language
curl "http://localhost:8080/search?q=test&format=json&language=en"
```

## Customization

Edit `settings.yml` to customize:
- Search engines
- UI preferences
- Security settings
- Rate limiting
- And more...

Refer to the [SearxNG documentation](https://docs.searxng.org/) for all available options.

## Important Notes

- **Change the secret key** in `settings.yml` before deploying to production
- The `limiter` is disabled by default - enable it for production use
- Image proxy is enabled for privacy

## Stopping the Service

```bash
docker-compose down
```

## Logs

```bash
docker-compose logs -f searxng
```

