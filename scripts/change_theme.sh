#!/bin/bash
CONFIG="$HOME/.config/alacritty/alacritty.toml"
THEME_DIR="$HOME/.config/alacritty/themes"
ARG=$1

get_theme_names (){
	cd $THEME_DIR
	shopt -s nullglob	
	for f in *; do
		echo $f |grep -v theme.yaml | cut -d"." -f 1
	done
	shopt -u nullglob
}

if [ -z $ARG ]; then
	echo "Requires theme name or 'list'.  
	example: $0 moonlight
	or $0 list
	or $0 random" 
	exit
fi

if [ $ARG = "list" ]; then	
	get_theme_names
	exit
fi

if [ $ARG = "random" ]; then
	OUTPUT=($(get_theme_names))
	#echo DEBUG: List of themes:\""${OUTPUT[@]}" \"
	LEN="$((${#OUTPUT[@]}-1))"
	I=$(shuf -i 0-$LEN -n 1)
	THEME_NAME="${OUTPUT[$I]}"
	echo "Theme set to: $THEME_NAME"
else
	THEME_NAME=$ARG
fi



if [ -n THEME_NAME ] && [ -f $THEME_DIR/$THEME_NAME.yaml ]; then
	ln -sf $THEME_DIR/$THEME_NAME.yaml $THEME_DIR/theme.yaml
	touch $CONFIG
else
	echo "Theme file, '$THEME_NAME.yaml' does not exist in $THEME_DIR."
fi