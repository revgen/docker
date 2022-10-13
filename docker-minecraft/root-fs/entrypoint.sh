#!/bin/sh
echo "Update UID and GID for the ${MINECRAFT_USER}"
usermod -u ${PUID:-"1000"} "${MINECRAFT_USER}"
groupmod -g ${PGID:-"1000"} "${MINECRAFT_USER}"

new_password=${PASSWORD:-"${MINECRAFT_PASSWORD}"}
if [ -n "${new_password}" ]; then
    echo "Update password for ${MINECRAFT_USER}"
    echo "${MINECRAFT_USER}:${new_password}" | chpasswd
fi

mkdir -p "${MINECRAFT_DIR}"
cd "${MINECRAFT_DIR}"
if [ ! -f "server.jar" ]; then
    echo "File server.jar not found in ${PWD}. Try to download it form the mojang.com server..."
    wget -O ./server.jar "https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar" || exit 1
fi
if [ ! -f "eula.txt" ]; then
    echo "eula=true" > ./eula.txt
else
    sed -e 's/eula=false/eula=true/g' ./eula.txt
fi
echo "Update permissions on the ${MINECRAFT_DIR} directory"
chown -R ${MINECRAFT_USER}:${MINECRAFT_USER} "${MINECRAFT_DIR}"
chmod 0775 "${MINECRAFT_DIR}"

echo "System"
echo "CPUs: $(nproc)"
grep  "MemTotal\|MemFree\|SwapTotal\|SwapFree" /proc/meminfo
echo ""
echo "Start supervisor"
exec /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf
