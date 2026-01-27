FROM docker:latest

RUN apk add --no-cache bash git

COPY builder.sh /usr/local/bin/builder.sh

RUN chmod +x /usr/local/bin/builder.sh

ENTRYPOINT ["/usr/local/bin/builder.sh"]