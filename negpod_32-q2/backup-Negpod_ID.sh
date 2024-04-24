#!/bin/bash

# Define remote server details
host="64293e56bc62.3a2627c1.alu-cod.online"
username="64293e56bc62"
password="328d3b338a4ced526c9a"
backup_location="/summative/1023-2024j"

# Tar and compress the directory to be backed up
tar -czf negpod_id-q1_backup.tar.gz negpod_id-q1

# Use scp to copy the backup to the remote server
scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -P 22 negpod_id-q1_backup.tar.gz $username@$host:$backup_location

# Remove the local backup file
rm negpod_id-q1_backup.tar.gz

