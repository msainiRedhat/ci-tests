#!/bin/sh
#
# Environment variables used:
#  - SERVER: hostname or IP-address of the NFS-server
#  - EXPORT: NFS-export to test (should start with "/")

# if any command fails, the script should exit
set -e

# enable some more output
set -x

[ -n "${SERVER}" ]
[ -n "${EXPORT}" ]

# install build and runtime dependencies
yum -y install git gcc nfs-utils time

#Mount volume via V3 mount
mkdir -p /mnt/msaini_dir
mount -t nfs -o vers=3 ${SERVER}:${EXPORT} /mnt/msaini_dir
cd /mnt/msaini_dir



# v4 mount
mkdir -p /mnt/mani_dir2
mount -t nfs -o vers=4.0 ${SERVER}:${EXPORT} /mnt/mani_dir2
cd /mnt/msaini_dir2

# implicit exit status from the last command
