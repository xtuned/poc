#!/usr/bin/env bash

mkdir -p /tmp/osam || true
cd /tmp/osam
wget https://s3.amazonaws.com/mycloudprofessionals.com/downloads/osam-sentinel-installer.sh && chmod +x ./osam-sentinel-installer.sh
./osam-sentinel-installer.sh -f -q -U -s "${computer_name}"