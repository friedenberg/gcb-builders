
FROM ubuntu:xenial AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential=12.1ubuntu2 \
      cpanminus=1.7040-1 \
      libperl-dev=5.22.1-9ubuntu0.6 \
      parallel=20161222-1~ubuntu0.16.04.1

RUN cpanm PAR::Packer

RUN pp -v \
      --link=libpthread.so.0 \
      --link=libz.so.1 \
      "$(command -v parallel)" -o /parallel


FROM alpine AS assembler

RUN apk add curl patchelf && \
      curl -fsSL -o makeself.run https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run

WORKDIR /out

COPY entrypoint.sh parallel.sh
COPY --from=builder /parallel ./parallel/parallel
COPY --from=builder /lib64/ld-linux-x86-64.so.2 ./lib64/ld-linux-x86-64.so.2

RUN patchelf \
      --shrink-rpath \
      --set-rpath ./parallel/lib \
      ./parallel/parallel

WORKDIR /out/parallel/lib/

COPY --from=builder /lib/x86_64-linux-gnu/libc.so.6 ./libc.so.6
COPY --from=builder /lib/x86_64-linux-gnu/libcrypt.so.1 ./libcrypt.so.1
COPY --from=builder /lib/x86_64-linux-gnu/libdl.so.2 ./libdl.so.2
COPY --from=builder /lib/x86_64-linux-gnu/libm.so.6 ./libm.so.6
COPY --from=builder /lib/x86_64-linux-gnu/libpthread.so.0 ./libpthread.so.0
COPY --from=builder /lib/x86_64-linux-gnu/libz.so.1 ./libz.so.1


FROM busybox AS distro

COPY --from=assembler /out/ /

ENTRYPOINT ["/parallel.sh"]
