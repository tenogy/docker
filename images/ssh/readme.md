#SSH keys generation image
build container

`build --rm -t tenogy/ssh .`

## Publication

push image

`docker push tenogy/ssh`

run image

`docker run -it --rm -v "C:/temp/keys:/home/keys" tenogy/ssh`

run with passphrase for centos on windows

`docker run -it --rm -v "/c/temp/keys:/home/keys" tenogy/ssh ssh-keygen -t rsa  -f /home/keys/rsa_key -N 'some password'`