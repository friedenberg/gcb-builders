
FROM alpine AS builder

RUN apk add parallel

FROM scratch AS assembler

# hadolint ignore=DL3022
COPY --from=busybox:1.31.1 /bin /bin

# hadolint ignore=DL3022
COPY --from=builder /usr/bin/parallel /bin

# hadolint ignore=DL3022
COPY --from=koalaman/shellcheck /bin/shellcheck /bin

# hadolint ignore=DL3022
COPY --from=hadolint/hadolint /bin/hadolint /bin

COPY entrypoint.sh /bin

FROM scratch AS distro

COPY --from=assembler /bin /bin

ENTRYPOINT ["/bin/entrypoint.sh"]
