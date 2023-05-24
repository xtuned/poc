#!/usr/bin/env bash
mkdir -p /tmp/osam || true
cd /tmp/osam
wget https://s3.amazonaws.com/mycloudprofessionals.com/downloads/osam-sentinel-installer.sh
chmod +x osam.sh 
./osam.sh -q -U -s "${computer_name}"