#!/bin/bash

echo Removing custom PYTHONHOME and PYTHONPATH from Vitis IDE
unset PYTHONHOME
unset PYTHONPATH

echo removing build directory:
rm -R build

echo Starting Make:
make V=1
cp build/micropython.elf ../../Debug/micropy.elf

