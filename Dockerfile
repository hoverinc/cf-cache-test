FROM alpine:3.10 AS builder

RUN apk add --no-cache curl

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
      && chmod a+x /usr/local/bin/kubectl

FROM alpine:3.10 AS final

COPY --from builder /usr/local/bin/kubectl /usr/local/bin/kubectl

ARG CACHE_INVALIDATE=""

RUN echo $CACHE_INVALIDATE && sleep 10
