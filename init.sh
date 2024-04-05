#!/bin/bash

path=$HOME/.dotfiles

if [ -d ${path} ]; then

	if [ ! -e "$HOME/.dotfiles_backup" ]; then
		mkdir "$HOME/.dotfiles_backup"
	fi

	for entry in $path/.* $path/*; do
		name="$(basename "$entry")"
		if [ -h "$HOME/$name" ]; then
			echo link $name already exists
			continue
		fi
		if [ -f "$entry" ] && [ "$entry" != "$path/.git" ] && [ "$entry" != "$path/.gitignore" ] && [ "$entry" != "$path/.gitmodules" ] && [ "$entry" != "$path/init.sh" ]; then
			if [ -e "$HOME/$name" ]; then
				echo "$HOME/$name" already exists, move it to .dotfiles_backup
				mv -i "$HOME/$name" "$HOME/.dotfiles_backup/$name"
			fi
			ln -si "$entry" "$HOME/"
			echo link "$entry" to "$HOME/"
		elif [ -d "$entry" ] && [ "$entry" != "$path/.git" ] && [ "$entry" != "$path/." ] && [ "$entry" != "$path/.." ]; then
			if [ -e "$HOME/$name" ]; then
				if [ "$entry" == "$path/.config" ]; then
					for dir in $entry/*; do
						configname="$(basename "$dir")"
						if [ -h "$HOME/$name/$configname" ]; then
							echo link $configname already exists
							continue
						fi
						if [ -e "$HOME/$name/$configname" ]; then
							echo "$HOME/$name/$configname" already exists, move it to .dotfiles_backup
							mkdir -p "$HOME/.dotfiles_backup/$name/$configname"
							mv -i "$HOME/$name/$configname" "$HOME/.dotfiles_backup/$name/$configname"
						fi
						ln -si "$entry/$configname" "$HOME/$name/"
						echo link "$entry/$configname" to "$HOME/$name/"
					done
				else
					echo "$HOME/$name" already exists, move it to .dotfiles_backup
					mkdir -p "$HOME/.dotfiles_backup/$name/$configname"
					mv -i "$HOME/$name" "$HOME/.dotfiles_backup/$name"
					ln -si "$entry" "$HOME/"
					echo link "$entry" to "$HOME/"
				fi
			else
				ln -si "$entry" "$HOME/"
				echo link "$entry" to "$HOME/"
			fi
		fi
	done
fi

git submodule update --init --recursive
# if [ ! -h $HOME/.local/share/nvim ]; then
# 	ln -s "$path/.local/share/nvim" "$HOME/.local/share/"
#     echo "link $path/.local/share/nvim/ to $HOME/.local/share/nvim"
# else
#     echo "$HOME/.local/share/nvim already exists"
# fi
