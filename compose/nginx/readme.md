##Step 1: setting http-proxy
see nginx.conf and docker-compose.yml

##Step 2: Install certificate

certbot https://hub.docker.com/r/certbot/certbot/tags
```
docker pull certbot/certbot:v2.6.0
```
run command:

`docker run -it --rm -v "/storage/nginx/letsencrypt:/etc/letsencrypt" -v "/storage/nginx/cert:/var/www" certbot/certbot:v2.6.0 certonly --webroot -w /var/www -m <some user>@gmail.com --noninteractive --rsa-key-size 4096 --agree-tos --force-renewal -d yoursite.com --staging`

If all is ok run commnad withaut `--staging` flag

Certificate will be generated into `/storage/nginx/letsencrypt/yoursite.com` directory 

So 

- `privkey.pem`  : the private key for your certificate.
- `fullchain.pem`: the certificate file used in most server software.      
- `chain.pem`    : used for OCSP stapling in Nginx >=1.3.7.
- `cert.pem`     : will break many server configurations, and should not be used without reading further documentation.

check https://github.com/certbot/certbot/blob/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf

##Step 3: Generate secret

`docker run -it --rm -v "/app/nginx/ssl:/etc/nginx/ssl" --entrypoint "openssl" certbot/certbot dhparam -out /etc/nginx/ssl/dhparam.pem 2048`

##Step 4: re-run nginx service
`docker-compose restart` or `docker exec nginx nginx -s reload`

##Step 5: Setting up certificate renew
Create service based on `docker-compose.cert.yml`
