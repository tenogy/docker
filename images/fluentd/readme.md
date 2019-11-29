#Fluntd with Elasticsearch plugin
build container

`docker build --rm -t tenogy/fluentd .`

## Publication

push image

`docker push tenogy/fluentd`
`docker push tenogy/fluentd:v1.7.4-1.0`

## run image

`docker run --rm -d --name fluentd -p 9880:9880 -v /app/fluentd:/fluentd/etc -e FLUENTD_CONF=fluentd.conf tenogy/fluentd`

fluentd/conf/fluent.conf

```
<source>
  @type forward
  port 9880
  bind 0.0.0.0
</source>
<match *.**>
  @type copy
  <store>
    @type elasticsearch
    host elasticsearch
    port 9200
    logstash_format true
    logstash_prefix fluentd
    logstash_dateformat %Y%m%d
    include_tag_key true
    type_name access_log
    tag_key @log_name
    flush_interval 1s
  </store>
  <store>
    @type stdout
  </store>
</match>
```
