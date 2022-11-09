FROM postgres:15.0

COPY --from=docker.eco-net/wal-g:1.0.2 /wal-g /

# See environment variables documentation https://github.com/wal-g/wal-g#configuration
#ENV WALE_S3_PREFIX=s3://bucket/path/to/folder
#ENV AWS_ACCESS_KEY_ID=xxxx
#ENV AWS_SECRET_ACCESS_KEY=secret
#ENV AWS_REGION=us-west-2
#ENV AWS_ENDPOINT=http://s3-like-service:9000
ENV AWS_S3_FORCE_PATH_STYLE=true
ENV WALG_COMPRESSION_METHOD=brotli

# See environment variables documentation https://github.com/wal-g/wal-g/blob/master/PostgreSQL.md#configuration
ENV PGHOST=/var/run/postgresql
ENV PGUSER=postgres
#ENV PGPASSWORD=secret
#ENV WALG_PGP_KEY_PATH=/keys/wal-g.pub

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]