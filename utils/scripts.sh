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
	"$HOME/utils/ag"
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
	echo "unzip $file to $folder, enter to $folder? [Y/n]\c"
	read -r choice
	if [ "$choice" != "n" ] && [ "$choice" != "N" ]; then
		xdg-open "./$folder" || exit
	fi
}
#-----------

#---source conda---
# >>> conda initialize >>>
source_conda() {
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
			. "/opt/anaconda/etc/profile.d/conda.sh"
		else
			export PATH="/opt/anaconda/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}
#-----------------

#---source nvm---
source_nvm() {
	source /usr/share/nvm/init-nvm.sh
}
#---------------
