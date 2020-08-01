#SSH keys generation image
build container

`docker build --rm -t tenogy/lsyncd .`

## Publication

push image

`docker push tenogy/lsyncd`

docker-compose.yml
```
version: "3.4"

services:
  # lsyncd container to sync up host mount and named volume:
  lsyncd:
    image: tenogy/lsyncd
    container_name: lsyncd
    command: -rsyncssh /storage host.com /storage
    volumes:
      - /storage:/storage:delegated

```



