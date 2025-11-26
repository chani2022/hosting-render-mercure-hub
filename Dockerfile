FROM caddy:2.8.0-builder AS builder

RUN xcaddy build \
    --with github.com/dunglas/mercure@latest \
    --with github.com/dunglas/mercure/caddy@latest

FROM caddy:2.8.0
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile