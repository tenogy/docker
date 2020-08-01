FROM alpine
RUN apk update;apk --no-cache add openssh lsyncd rsync
RUN mkdir /home/keys
ENTRYPOINT ["lsyncd", "-nodaemon", "-delay", "0"]