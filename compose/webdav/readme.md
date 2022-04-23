Based on  https://github.com/jgeusebroek/docker-webdav
and
https://www.lighttpd.net/.

1. Create share folder
```
mkdir /d/storage/production/webdav
```

2. Create webdav user and group and put permissions for created folder
```
adduser -u 2222 webdav
addgroup -g 2222 webdav
adduser webdav webdav
chown -R webdav:webdav /d/storage/production/webdav
```
3. save htpasswd to config/htpasswd 
generator https://www.transip.nl/htpasswd/

4. configure config/webdav.conf 
```
$HTTP["remoteip"] !~ "WHITELIST" {

  # Require authentication
  $HTTP["host"] =~ "." {
    server.document-root = "/webdav"
    
    webdav.activate = "enable"
    webdav.is-readonly = "disable"

    auth.backend = "htpasswd"
    auth.backend.htpasswd.userfile = "/config/htpasswd"
    auth.require = ( "" => ( "method" => "basic",
                             "realm" => "webdav",
                             "require" => "valid-user" ) )
  }

}
else $HTTP["remoteip"] =~ "WHITELIST" {

  # Whitelisted IP, do not require user authentication
  $HTTP["host"] =~ "." {
    server.document-root = "/webdav"
    
    webdav.activate = "enable"
    webdav.is-readonly = "disable"
  }

}

```

5. docker compose:
```
version: "3.4"

services:
  mssql:
    restart: unless-stopped
    image: jgeusebroek/webdav
    container_name: webdav
    environment:
      - READWRITE=true
    ports:
      - 8080:80
    volumes:
      - /d/storage/production/webdav:/webdav
      - ./config:/config
```

