##Step 1: setting http-proxy
nginx.cfg:

   
    worker_processes 4;

    events { worker_connections 1024; }

    http {
        sendfile on;

    upstream app_servers {
            server 192.168.0.1:8080;
        }
        
    }

    server {
        listen 80;
        location / {
            proxy_pass         http://app_servers;
            proxy_http_version 1.1;
            proxy_set_header   Upgrade $http_upgrade;
            proxy_set_header   Connection keep-alive;
            proxy_set_header   Host $host;
            proxy_cache_bypass $http_upgrade;
            proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Proto $scheme;
        }
        }
    }



docker-compose.yml:

    version: "3.4"

    services:
    nginx:
        restart: unless-stopped
        image: nginx:alpine
        volumes:
        - ./nginx.conf:/etc/nginx/nginx.conf
        ports:
        - 80:80
        - 443:443
        networks:
        - frontend
        command: '/bin/sh -c ''while :; do sleep 6h & wait $${!}; nginx -s reload; done & nginx -g "daemon off;"'''

    networks:
    frontend:
        external:
        name: frontend


##Step 2: Install certificate
nginx configuration:
```
...
 location /.well-known/acme-challenge/ {
       root /web/certificate/root;
  }
...
```
run command:

`docker run -it --rm -v "/etc/letsencrypt:/etc/letsencrypt" -v "/web/certificate/root:/var/www" certbot/certbot certonly --webroot -w /var/www -m **user@gmail.com** --noninteractive  --rsa-key-size 4096 --agree-tos --force-renewal -d **yoursite.com** --staging`

If all is ok run commnad withaut `--staging` flag

Certificate will be generated into `/etc/letsencrypt/live/yoursite.com` directory 

So 

- `privkey.pem`  : the private key for your certificate.
- `fullchain.pem`: the certificate file used in most server software.      
- `chain.pem`    : used for OCSP stapling in Nginx >=1.3.7.
- `cert.pem`     : will break many server configurations, and should not be used without reading further documentation (see link below).

##Step 3: Generate secret

`docker run -it --rm -v "/etc/nginx/ssl:/etc/nginx/ssl" --entrypoint "openssl" certbot/certbot  dhparam -out /etc/nginx/ssl/dhparam.pem 2048`

##Step 4: Setting up and re-run nginx service
Get configs from `prod/docker-compose.nginx.yml` and `prod/nginx.conf`

##Step 5: Setting up certificate renew
Create service based on `prod/docker-compose.cert.yml`
