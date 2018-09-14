#!/usr/bin/env bash

### Guide used: https://blog.ssdnodes.com/blog/host-multiple-ssl-websites-docker-nginx/

echo "Docker network: nginx-proxy"
if [ ! "$(docker network ls | grep nginx-proxy)" ]; then
    docker network create nginx-proxy
else    
    echo "exist!"
fi

if [ ! -f nginx.tmpl ]; then
    echo "Downloading nginx.tmpl"
    curl https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl > nginx.tmpl
fi

echo "Starting nginx-proxy"
docker-compose up -d

echo "Nginx should be started. Manually check it below. There should be 3 containers respectively named 'nginx-proxy', 'nginx-proxy-gen' and 'nginx-proxy-le':"
docker ps | grep nginx-proxy

# If they don't work, use docker logs nginx-proxy, nginx-proxy-gen, nginx-proxy-le to see what is wrong.
