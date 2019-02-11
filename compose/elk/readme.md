mkdir -p your_directory /mnt/data/metricbeat

sudo curl -L "https://raw.githubusercontent.com/tenogy/docker/master/compose/elk/metricbeat.yml" -o /mnt/data/metricbeat/metricbeat.yml


sudo curl -L "https://raw.githubusercontent.com/tenogy/docker/master/compose/elk/docker-compose-elk-$(uname -s)-$(uname -m).yml" -o /mnt/data/docker/compose/elk/docker-compose.yml


cd /mnt/data/docker/compose/elk


docker-compose up -d
