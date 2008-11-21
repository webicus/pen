#!/usr/bin/bash
#
# Used write out the version of the this code.
#   

 
base=pen
echo "you should be in the directory: $base"
pwd;


echo " "
echo " "
git log | head -4

output="doc/version.txt"
ofile=temp-junk
echo "-----------------------------" >> $ofile
echo "Comment: $1" >> $ofile
echo "-----------------------------" >> $ofile
date >> $ofile
pwd >> $ofile
git log | head -4 >> $ofile
cat $ofile >> $output
echo "Created $output"
cat $ofile
rm temp-junk


