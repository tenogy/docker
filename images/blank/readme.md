# Minimum empty container.

## Compilation and build

compile empty linux executable

`docker run --rm -it -v "C:/p/docker/blank:/usr/src/myapp" -w /usr/src/myapp amd64/gcc:4.9 gcc -static -Os -nostartfiles -fno-asynchronous-unwind-tables -o blank main.c`

build container

`docker build -t blank .`

test it

`docker run -it --rm blank`

## Publication

tag image

`docker tag blank tenogy/blank`

push image

`docker push tenogy/blank`

run image

`docker run -it --rm tenogy/blank`
