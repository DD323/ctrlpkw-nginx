#!/usr/bin/env bash
CONF=/etc/nginx/conf.d/upstream.conf
LENGTH=`cat $CONF | wc -l`
PATH=/bin:/usr/bin
if [[ $LENGTH -gt 2 ]]; then
  sed -i.bak "2,$((LENGTH-1))d" $CONF
    for i in $(dig +short SRV _ctrlpkw.app.ctrlpkw._tcp.marathon.mesos | awk 'BEGIN { FS= " "}; { print $4":"$3 }'); do
      sed -i.bak "s!}!\tserver $i;\n}!" $CONF
    done
fi

