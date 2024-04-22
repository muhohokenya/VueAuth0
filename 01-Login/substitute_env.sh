#!/bin/sh
# entrypoint.sh

# Perform environment substitution
envsubst < /usr/share/nginx/html/config.js.template > /usr/share/nginx/html/assets/config.js

echo "Running substitution"
# Start Nginx
exec nginx -g 'daemon off;'