# syntax=docker/dockerfile:1

FROM alpine:latest AS builder

RUN apk add --no-cache git openssh-client

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh git clone git@github.com:wikluk-lab/pawcho6.git /app

ARG VERSION
ENV APP_VERSION=$VERSION

RUN export MY_IP=$(hostname -i) && \
    export MY_HOSTNAME=$(hostname) && \
    sed -i "s/VERSION_PLACEHOLDER/$APP_VERSION/g" /app/index.html && \
    sed -i "s/HOSTNAME_PLACEHOLDER/$MY_HOSTNAME/g" /app/index.html && \
    sed -i "s/IP_PLACEHOLDER/$MY_IP/g" /app/index.html

FROM nginx:alpine

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80