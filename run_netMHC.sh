#!/usr/bin/env bash

while read LINE; do
   pep=`echo ${LINE} | cut -f1 -d ','`
   allele=`echo ${LINE} | cut -f2 -d ','`
   echo $pep | /home/hadoop/netMHC-4.0/netMHC -a ${allele} -p --
done

