#!/bin/bash

THEME=$1
THEMES_FOLDER_NAME=$HOME/.config/polybar/themes
THEME_FOLDER=$THEMES_FOLDER_NAME/$THEME
INCLUDE_MODULES_FILE_PATH=$THEME_FOLDER/include.ini

cat /dev/null > $INCLUDE_MODULES_FILE_PATH

for file in $THEMES_FOLDER_NAME/$THEME/modules/*.ini
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
    MONITOR=$m polybar example --reload -c $THEME_FOLDER/main.ini &
  done
else
  polybar example --reload -c $THEME_FOLDER/main.ini &
fi
