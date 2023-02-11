#!/bin/bash

# Создать скрипт ownersort.sh, который в заданной папке копирует файлы в директории, названные по имени владельца каждого файла. 
# Учтите, что файл должен принадлежать соответствующему владельцу.

dir_path=$1/;


if [[ -e $dir_path ]] && [[ -d $dir_path ]]; then
	for f_name in $(ls $dir_path); do
		file_path=$dir_path$f_name
		if [[ -f $file_path ]]; then
			file_owner=$(stat -c %U $file_path);
			mkdir -p $dir_path$file_owner;
			mv $file_path $dir_path$file_owner/$f_name;
		fi
	done

else
	echo "ERROR! $dir_path : this directory is not found!"; 
	exit 1;
fi
