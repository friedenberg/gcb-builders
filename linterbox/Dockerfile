

FROM alpine AS builder

RUN apk add --no-cache \
      ca-certificates \
      perl \
      parallel

# hadolint ignore=DL3022
COPY --from=koalaman/shellcheck /bin/shellcheck /bin

# hadolint ignore=DL3022
COPY --from=hadolint/hadolint /bin/hadolint /bin

COPY --from=garethr/kubeval /kubeval /bin

COPY entrypoint.sh /bin
COPY wrapper.sh /bin
COPY run.sh /bin

RUN mkdir -p /root/.parallel/ && touch /root/.parallel/will-cite

FROM scratch
COPY --from=builder / /
ENTRYPOINT ["/bin/entrypoint.sh"]

