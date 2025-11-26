FROM caddy:2.7.4-builder AS builder

RUN xcaddy build \
    --with github.com/dunglas/mercure@v0.15.6 \
    --with github.com/dunglas/mercure/caddy@v0.15.6

FROM caddy:2.7.4
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile