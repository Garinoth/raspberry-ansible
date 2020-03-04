#!/bin/sh
EXTERNAL_DRIVE=/mnt/DAS_1_Blinky
BACKUP_PATH=backup/`hostname -s`
ARCHIVE_FILE="$1"

if [ -z "$1" ]; then
  echo "Please specify the full path of the archive file."
fi

if mount | grep $EXTERNAL_DRIVE > /dev/null; then
  logger -s "Exporting backup to external drive..."
  mkdir -p $EXTERNAL_DRIVE/$BACKUP_PATH
  cp $ARCHIVE_FILE $EXTERNAL_DRIVE/$BACKUP_PATH/
  logger -s "Backup export complete."
else
  logger -s "External drive not mounted. Exiting..."
fi