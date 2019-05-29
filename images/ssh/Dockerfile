FROM alpine
RUN apk update;apk add openssh
RUN mkdir /home/keys
CMD ssh-keygen -t rsa  -f /home/keys/rsa_key -N ''