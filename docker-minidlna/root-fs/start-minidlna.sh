#!/bin/sh
cfg_file=/etc/minidlna.conf
cp -v "${cfg_file}" "${cfg_file}.orig"

DLNA_SERVER_NAME=${DLNA_SERVER_NAME:-"MediaServer"}
echo "Start '${DLNA_SERVER_NAME}' minidlna server"
if [ -n "${DLNA_SERVER_NAME}" ]; then
    sed 's/friendly_name=MediaServer/friendly_name='"${DLNA_SERVER_NAME}"'/g' \
        "${cfg_file}.orig" > "${cfg_file}" || exit 1
fi

exec /usr/sbin/minidlnad -S
