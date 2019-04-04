#!/usr/bin/bash

systemctl daemon-reload
systemctl enable puma_puma-socket_production.service
systemctl start puma_puma-socket_production.service

socat TCP-LISTEN:3000 UNIX-CONNECT:/var/www/application/shared/tmp/sockets/puma.sock &

sleep 10
tail -f /var/www/application/shared/log/puma_access.log
