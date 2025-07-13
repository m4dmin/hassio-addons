FROM semaphoreui/semaphore:latest

USER root

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --no-cache openssl nginx \
 && mkdir -p /run/nginx

WORKDIR /data

COPY --chmod=755 run.sh /run.sh
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 3000

CMD ["/run.sh"]
