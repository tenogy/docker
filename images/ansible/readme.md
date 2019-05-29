#Ansible with ssh
build container

`docker build --rm -t tenogy/ansible .`

## Publication

push image

`docker push tenogy/ansible`

run image

`docker run -d --rm -p 49100:22 tenogy/ansible`
`ssh -p 49100  user@localhost`
