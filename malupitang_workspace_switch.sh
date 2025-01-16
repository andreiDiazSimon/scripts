#!/bin/bash
EDGE_THRESHOLD=5

SCREEN_GEOMETRY=$(xdotool getdisplaygeometry)
SCREEN_WIDTH=$(echo $SCREEN_GEOMETRY | awk '{print $1}')
SCREEN_HEIGHT=$(echo $SCREEN_GEOMETRY | awk '{print $2}')

LAST_CURSOR_X=0
LAST_CURSOR_Y=0
SWITCHED=false

while true; do
  CURSOR_POSITION=$(hyprctl cursorpos)
  CURSOR_X=$(echo $CURSOR_POSITION | cut -d',' -f1) 
  CURSOR_Y=$(echo $CURSOR_POSITION | cut -d',' -f2) 

  if [ "$CURSOR_X" -le "$EDGE_THRESHOLD" ] && [ "$CURSOR_Y" -le "$EDGE_THRESHOLD" ]; then
    if ! $SWITCHED && { [ "$LAST_CURSOR_X" -ne "$CURSOR_X" ] || [ "$LAST_CURSOR_Y" -ne "$CURSOR_Y" ]; }; then
      hyprctl dispatch workspace e-1 
      SWITCHED=true
    fi
  elif [ "$CURSOR_X" -ge $(($SCREEN_WIDTH - $EDGE_THRESHOLD)) ] && [ "$CURSOR_Y" -le "$EDGE_THRESHOLD" ]; then
    if ! $SWITCHED && { [ "$LAST_CURSOR_X" -ne "$CURSOR_X" ] || [ "$LAST_CURSOR_Y" -ne "$CURSOR_Y" ]; }; then
      hyprctl dispatch workspace e+1 
      SWITCHED=true
    fi
  else
    SWITCHED=false 
  fi

  LAST_CURSOR_X=$CURSOR_X
  LAST_CURSOR_Y=$CURSOR_Y

done
