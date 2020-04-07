FROM alpine:3.11

RUN apk add --no-cache --update ca-certificates

COPY dist/linux-amd64/{{_input_:name}} /{{_input_:name}}

ENTRYPOINT ["/{{_input_:name}}"]
