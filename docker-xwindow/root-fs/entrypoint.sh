#!/bin/bash
set -e
SCRIPT_NAME="$(basename "${0}")"

export XWINDOW_DISPLAY="${XWINDOW_DISPLAY:-":10.0"}"
export XWINDOW_RESOLUTION="${XWINDOW_RESOLUTION:-"1280x780"}"

echo "Update password for the main user"
if [ -n "${MAINUSER_PASSWORD}" ]; then
    echo "${MAINUSER}:${MAINUSER_PASSWORD}" | chpasswd
fi
if [ "${PUID}" ]; then
    groupmod -g "${PGID}" "${MAINUSER}"
    usermod -u "${PUID}" -g "${PGID}" "${MAINUSER}"
fi
chown ${MAINUSER}:${MAINUSER} -R /home/${MAINUSER}
echo "Done"

exec /usr/bin/supervisord -c "/etc/supervisor/conf.d/supervisord.conf"
