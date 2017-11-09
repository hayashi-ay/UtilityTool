#!/bin/bash

FILE_PATH="$HOME/.netrc"

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

	read -p "Gitのドメイン名を入力してください:" domain
	echo "machine $domain" >> $FILE_PATH
	read -p "ユーザー名を入力してください:" user
	echo "login $user" >> $FILE_PATH
	read -p "パスワードを入力してください:" password
	echo "password $password" >> $FILE_PATH
}

if [ -e $FILE_PATH ]; then
	askYesNo "File exists. Do you want to overwrite it?"
	if [ $? -eq 0 ]; then
		>$FILE_PATH
		writeFile
	fi
else 
	touch $FILE_PATH
	writeFile
fi
