#!/usr/bin/env bash
mkdir -p /tmp/osam || true
cd /tmp/osam
curl -O https://s3.amazonaws.com/mycloudprofessionals.com/downloads/osam-sentinel-installer.sh && chmod +x ./osam-sentinel-installer.sh
./osam-sentinel-installer.sh -q 
hostnamectl set-hostname "${computer_name}"
reboot
