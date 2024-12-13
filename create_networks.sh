#!/bin/sh

for net in "sender-net receiver-net"; do
    docker network remove $net || true
done

docker network create --ipv6=true \
    --subnet=10.99.99.0/24 \
    --subnet=9999::0/64 \
    -o "com.docker.network.bridge.name=sender-net" \
    -o "com.docker.network.container_iface_prefix=sender" \
    sender-net

docker network create --ipv6=true \
    --subnet=10.88.88.0/24 \
    --subnet=8888::0/64 \
    -o "com.docker.network.bridge.name=receiver-net" \
    -o "com.docker.network.container_iface_prefix=receiver" \
    receiver-net