FROM alpine:3.10 AS builder

RUN apk add --no-cache curl

COPY cache-file-builder1 /usr/local/bin/

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
      && chmod a+x /usr/local/bin/kubectl

COPY cache-file-builder2 /usr/local/bin/

RUN sleep 10

FROM alpine:3.10 AS final

COPY cache-file-final1 /usr/local/bin/

COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl

COPY cache-file-final2 /usr/local/bin/

RUN sleep 10
