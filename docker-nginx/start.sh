#!/usr/bin/env bash

cd /etc/ssl/certs
#openssl dhparam -out dhparam.pem 4096

for i in $(dig +short SRV _ctrlpkw.app.ctrlpkw._tcp.marathon.mesos | awk 'BEGIN { FS= " "}; { print $4":"$3 }'); do
  sed -i.bak "s!}!\tserver $i;\n}!" /etc/nginx/conf.d/upstream.conf
done

cron

echo "*/1 * * * * /etc/nginx/update.sh" | crontab -

nginx -g "daemon off;"
