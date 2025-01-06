#!/bin/bash

sketchybar --add item media center \
           --set media label.max_chars=60 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
                       icon= \
           --subscribe media media_change
