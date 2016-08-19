#!/bin/bash
# Backup Completo e Incremental
folders="/home /var/www"
backupfolder=/mnt/usb/backups
datedir=/mnt/usb/backups
dsem=`date +%a`
dmes=`date +%d`
dym=`date +%d%b`

#backup mensual (completo)
if [$dmes="01"]; then
    tar -cf $backupfolder/ctm_$dym.tar $folders
fi

#backup semanal (completo)
if [$dsem="dom"]; then
    now=`date +%d-%b`
    echo $now > $datedir/backup-completo 
    tar -cf $backupfolder/cts_$dsem.tar $folders

#backup diario (incremental: sobrescribe semana anterior)

else
    nuevo="--newer=`cat $datedir/backup-completo`"
    tar $nuevo -cf $backupfolder/id_$dsem.tar $folders
fi
