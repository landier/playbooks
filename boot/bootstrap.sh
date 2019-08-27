#!/bin/bash

# Specify Config Transpiler version
CT_VER=v0.9.0

# Specify Architecture
# ARCH=aarch64 # ARM's 64-bit architecture
ARCH=x86_64

# Specify OS
# OS=apple-darwin # MacOS
# OS=pc-windows-gnu.exe # Windows
OS=unknown-linux-gnu # Linux

# Specify Core OS channel
CHANNEL=beta

# Specify download URL
DOWNLOAD_URL=https://github.com/coreos/container-linux-config-transpiler/releases/download

# Remove previous downloads
# rm -f /tmp/ct-${CT_VER}-${ARCH}-${OS} /tmp/ct-${CT_VER}-${ARCH}-${OS}.asc /tmp/coreos-app-signing-pubkey.gpg

# Download Config Transpiler binary
curl -L ${DOWNLOAD_URL}/${CT_VER}/ct-${CT_VER}-${ARCH}-${OS} -o /tmp/ct-${CT_VER}-${ARCH}-${OS}
chmod u+x /tmp/ct-${CT_VER}-${ARCH}-${OS}

# # Download and import CoreOS application signing GPG key
# curl https://coreos.com/dist/pubkeys/app-signing-pubkey.gpg -o /tmp/coreos-app-signing-pubkey.gpg
# gpg2 --import --keyid-format LONG /tmp/coreos-app-signing-pubkey.gpg

# # Download and import CoreOS application signing GPG key if it has not already been imported
# curl -L ${DOWNLOAD_URL}/${CT_VER}/ct-${CT_VER}-${ARCH}-${OS}.asc -o /tmp/ct-${CT_VER}-${ARCH}-${OS}.asc
# gpg2 --verify /tmp/ct-${CT_VER}-${ARCH}-${OS}.asc /tmp/ct-${CT_VER}-${ARCH}-${OS}

rm -f /tmp/core-install
rm -f /tmp/ignition.yml
rm -f /tmp/ignition.json

curl https://raw.githubusercontent.com/coreos/init/master/bin/coreos-install -o /tmp/coreos-install
curl https://raw.githubusercontent.com/landier/playbooks/master/boot/ignition.yml -o /tmp/ignition.yml

/tmp/ct-${CT_VER}-${ARCH}-${OS} < /tmp/ignition.yml > /tmp/ignition.json
sleep 2

chmod u+x /tmp/coreos-install

/tmp/coreos-install \
    -d /dev/sda \
    -C $CHANNEL \
    -i /tmp/ignition.json

echo Done
read -p "Press [ENTER] to continue."
#reboot
