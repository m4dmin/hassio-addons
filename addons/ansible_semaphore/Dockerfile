FROM semaphoreui/semaphore:latest
USER root

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --no-cache openssl

WORKDIR /data

COPY --chmod=755 run.sh /run.sh

EXPOSE 3000

CMD ["/run.sh"]
