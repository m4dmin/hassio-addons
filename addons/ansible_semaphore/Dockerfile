#FROM semaphoreui/semaphore:latest
FROM semaphoreui/semaphore:v2.15.0

USER root

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --no-cache openssl

#RUN apk update \
# && apk upgrade --no-cache \
# && apk add --no-cache openssl nginx \
# && mkdir -p /run/nginx

WORKDIR /data

COPY --chmod=755 run.sh /run.sh
#COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 3100

CMD ["/run.sh"]
