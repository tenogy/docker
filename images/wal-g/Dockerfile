FROM golang:1.19 as builder

ENV WALG_VERSION=v2.0.1

RUN apt-get update && apt-get install -y build-essential cmake

RUN git clone https://github.com/wal-g/wal-g/  $GOPATH/src/wal-g \
    && cd $GOPATH/src/wal-g/ \
    && git checkout $WALG_VERSION \     
    && make deps \
    && make pg_build \
    && cp main/pg/wal-g / \
    && /wal-g --version

FROM debian:bullseye-slim
COPY --from=builder /wal-g /