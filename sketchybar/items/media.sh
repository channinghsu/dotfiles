media=(
  icon.background.drawing=on
  icon.background.image=media.artwork
  icon.background.image.corner_radius=9
  script="$PLUGIN_DIR/media.sh"
  # label.max_chars=15
  scroll_texts=on
  updates=on
)

sketchybar --add item media right\
           --set media "${media[@]}" \
           --subscribe media volume_change media_change video_close front_app_switched
