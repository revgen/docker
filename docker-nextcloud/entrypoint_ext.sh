#!/bin/sh

# ==[ Intersept uid/guid fix for MacOS host: start ]======
if [ -n "${PGID}" ] && [ -n "${PGID}" ]; then
    WWW_USER=www-data
    echo "Updating ${WWW_USER} UID=${PUID} and GID=${PGID}..."
    groupmod -g 120 dialout
    groupmod -g ${PGID} "${WWW_USER}"
    usermod -u ${PUID} -g ${PGID} "${WWW_USER}"
    echo "Update ${WWW_USER} UID=$(id -u ${WWW_USER}) and GID=$(id -g ${WWW_USER}) - Done"
fi
echo "Current user: ${USER} $(id -u)/$(id -g)"
# ==[ Intersept uid/guid fix for MacOS host: end ]========

