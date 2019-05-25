#SSH keys generation image
build container

`build --rm -t tenogy/ssh .`

## Publication

push image

`docker push tenogy/ssh`

run image

`docker run -it --rm -v "C:/temp/keys:/home/keys" tenogy/ssh`
