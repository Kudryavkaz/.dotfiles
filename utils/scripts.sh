#!/bin/bash
#---my script---

#---proxy script---
proxy_on() {
	export http_proxy=http://127.0.0.1:7899
	export https_proxy=$http_proxy
	echo -e "terminal proxy on"
}

proxy_off() {
	unset http_proxy https_proxy
	echo -e "terminal proxy off"
}

proxy_check() {
    curl cip.cc
}
#----------------

#---ask gpt---
ag() {
    env python "$HOME/utils/ag.py"
}
#-------------

#---makedir and cd---
mkcd() {
	mkdir -p "$1"
	cd "$1" || exit
}
#--------------------

#---unzip to folder---
uzf() {
    file=$1
    folder=${file%.*}
    unzip -q "$file" -d "$folder"
    echo "unzip $file to $folder, enter to $folder? [y/n]\c"
    read -r choice
    if [ "$choice" = "y" ];then
        cd "./$folder" || exit
    fi
}
#-----------
