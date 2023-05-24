#!/bin/sh
echo "Execute a custom $0 script"
echo "* PUID=${PUID}"
echo "* PGID=${PGID}"
# groupmod -g ${PGID} www-data
# usermod -u ${PUID} -g ${PGID} www-data
exec "/entrypoint.sh"