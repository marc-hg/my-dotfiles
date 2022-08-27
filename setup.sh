#!/bin/bash

echo 'Welcome to my conf and common programs installer'
echo 'Do you want to install programs or conf files?'

read -p 'Install programs or conf files? [p/c] ' -n 1 -r
echo

if [[ $REPLY =~ ^[Pp]$ ]]; then
    echo 'Installing programs'
    ./src/program_setup.sh
fi
if [[ $REPLY =~ ^[Cc]$ ]]; then
    echo 'Installing conf files'
    ./src/conf_setup.sh
fi