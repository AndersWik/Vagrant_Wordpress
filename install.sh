#!/bin/bash

FILE="devboxphp"
PATH="/usr/local/bin/"
MSG='#!/bin/bash
DIR=""
while getopts ":d:" opt; do
  case $opt in
    d)
      DIR=${OPTARG}
      ;;
  esac
done
git clone https://github.com/AndersWik/Vagrant_Dev_Box.git "$DIR"'

if [[ $EUID -ne 0 ]]; then
  echo "This script will create a file called
$FILE in $PATH and needs
to be run as root."
   exit 1
fi

echo "$MSG" > "$PATH$FILE"
/bin/chmod 755 "$PATH$FILE"
