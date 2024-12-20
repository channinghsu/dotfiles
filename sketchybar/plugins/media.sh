update_go_musicfox() {
  INFO=$(nowplaying-cli get title artist)
  TITLE=$(echo "$INFO" | awk 'NR==1 {print}' | sed 's/null//')
  ARTIST=$(echo "$INFO" | awk 'NR==2 {print}' | sed 's/null//')
  MEDIA="$TITLE - $ARTIST"
  sketchybar --set media icon.background.drawing=off label="$MEDIA"
}

case "$SENDER" in
# media change or volume change media_change
"media_change" | "volume_change" | "video_close" | "front_app_switched")
  update_go_musicfox
  ;;
*) ;;
esac
