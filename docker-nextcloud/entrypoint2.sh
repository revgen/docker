#!/bin/sh
echo "Execute a custom $0 script"
if [ -n "${PGID}" ] && [ -n "${PGID}" ]; then
    WWW_USER=www-data
    echo "Update ${WWW_USER} UID=${PUID} and GID=${PGID}"
    groupmod -g ${PGID} "${WWW_USER}"
    usermod -u ${PUID} -g ${PGID} "${WWW_USER}"
    echo "Update ${WWW_USER} UID=${PUID} and GID=${PGID} - Done"
fi
exec "/entrypoint.sh"