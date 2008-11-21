#!/usr/bin/bash
#
# Create image tar file backup
#   

base=pen
outDir=db
backupPath=/h/images-business/backup
echo "create new tar file"
sleep 2;
clear
echo " ";
echo "you should be in the directory: $base"
pwd;
echo "sleeping for 3....";
sleep 3;

dt=`date --iso-8601=minutes | sed "s/://g"`
outName=$outDir/pen-images.$dt.tar

tar -cf $outName public/images public/assets favicon.ico

ls -l $outName
gzip $outName
ls -l $outName.gz
cp $outName.gz $backupPath
echo done at `date --iso-8601=minutes | sed s/://g`
date
