#!/bin/bash
echo PATH env:
echo $PATH
echo  

echo Python Home:
unset PYTHONHOME
echo $PYTHONHOME
echo  
echo Python Path:
unset PYTHONPATH
echo $PYTHONPATH
echo  
echo Python sys:
echo $sys

#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
#echo $PATH

echo removing build directory:
rm -R build

echo Starting Make:
make V=1 CROSS=1
cp build/micropython.elf ../../Debug/micropy.elf

