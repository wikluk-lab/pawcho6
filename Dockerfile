FROM alpine:latest AS builder

ARG VERSION
ENV APP_VERSION=$VERSION

COPY index.html /tmp/index.html

RUN export MY_IP=$(hostname -i) && \
    export MY_HOSTNAME=$(hostname) && \
    sed -i "s/VERSION_PLACEHOLDER/$APP_VERSION/g" /tmp/index.html && \
    sed -i "s/HOSTNAME_PLACEHOLDER/$MY_HOSTNAME/g" /tmp/index.html && \
    sed -i "s/IP_PLACEHOLDER/$MY_IP/g" /tmp/index.html

FROM nginx:alpine

COPY --from=builder /tmp/index.html /usr/share/nginx/html/index.html

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80