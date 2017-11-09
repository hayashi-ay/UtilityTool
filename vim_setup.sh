#!/bin/bash

FILE_PATH="$HOME/.vimrc"

askYesNo(){
	while true; do
		read -p "$1 (y/n)>" input
		case $input in
		[yY] | [yY]es | YES ) return 0;;
		[nN] | [nN]o | NO) return 1;;
		*) echo "Please enter a valid value."
		esac
	done
}

writeFile(){
	echo "set nocompatible" > $FILE_PATH
	echo "set backspace=indent,eol,start" >> $FILE_PATH
	echo "set tabstop=4" >> $FILE_PATH
	echo "set number" >> $FILE_PATH
	echo "vim setting is finished."
}

if [ -e $FILE_PATH ]; then
	askYesNo "File exists. Do you want to overwrite it?"
	if [ $? -eq 0 ]; then
		writeFile
	fi
else 
	touch $FILE_PATH
	writeFile
fi
