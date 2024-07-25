#!/bin/bash

# 更新函数，更新界面的颜色和高亮状态
update() {
  source "$CONFIG_DIR/colors.sh"
  local color=$BACKGROUND_2
  if [ "$SELECTED" = "true" ]; then
    color=$GREY
  fi
  sketchybar --set "$NAME" icon.highlight="$SELECTED" \
                          label.highlight="$SELECTED" \
                          background.border_color="$color"
}

# 鼠标点击处理函数
mouse_clicked() {
  echo "Button clicked: $BUTTON, Space ID: $SID, Space Name: $NAME"

  if [ "$BUTTON" = "left" ]; then
    # 使用 AppleScript 模拟 Control + 数字键，切换到指定的 Space
    case "$SID" in
      1) key_code=18 ;;
      2) key_code=19 ;;
      3) key_code=20 ;;
      4) key_code=21 ;;
      5) key_code=23 ;;
      6) key_code=22 ;;
      7) key_code=26 ;;
    esac

    if [ -n "$key_code" ]; then
      osascript -e "tell application \"System Events\" to key code $key_code using control down"
      sketchybar --trigger space_change
    fi
  fi
}

# 主逻辑，根据发送者调用不同的函数
case "$SENDER" in
  "mouse.clicked") mouse_clicked ;;
  "space_windows_change") sketchybar --trigger windows_on_spaces ;;
  *) update ;;
esac
