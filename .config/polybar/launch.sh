#!/bin/bash

THEME=$1
THEMES_FOLDER=$HOME/.config/polybar/themes
THEME_SELECTED_FOLDER=$THEMES_FOLDER/$THEME
INCLUDE_MODULES_FILE_PATH=$THEME_SELECTED_FOLDER/include.ini

cat /dev/null > $INCLUDE_MODULES_FILE_PATH

for file in $THEMES_FOLDER/$THEME/modules/*.ini
do
  echo "include-file = $file" >> $INCLUDE_MODULES_FILE_PATH
done

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar on all monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "DP-0" ]; then
      BAR_WIDTH=98% TRAY_POS=right MONITOR=$m polybar $THEME --reload -c $THEME_SELECTED_FOLDER/main.ini &
    else
      BAR_WIDTH=99% TRAY_POS=hola MONITOR=$m polybar $THEME --reload -c $THEME_SELECTED_FOLDER/main.ini &
    fi
  done
else
  polybar $THEME --reload -c $THEME_SELECTED_FOLDER/main.ini &
fi
