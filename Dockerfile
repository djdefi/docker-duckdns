FROM hypriot/rpi-alpine-scratch

RUN apk update && \
apk upgrade && \
apk add bash curl && \
rm -rf /var/cache/apk/*

VOLUME ["/config"]

# Add dynamic dns script
COPY duck.sh /root/duckdns/duck.sh

RUN chmod +x /root/duckdns/duck.sh 

CMD /root/duckdns/duck.sh
