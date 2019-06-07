#!/bin/bash -xv
#
# control fireTv via adb

COMMANDS=$@
IP=amazon-fire  # set to 192.168.42.153 by dhcp
PORT=5555
ADB=adb
SEND_KEY="$ADB -s $IP:$PORT shell input keyevent"
START_APP="$ADB -s $IP:$PORT shell am start -n"


ARD=de.swr.ard.avp.mobile.android.amazon
ZDF=com.zdf.android.mediathek

adb connect amazon-fire

for CMD in $COMMANDS ; do

  case $CMD in
    wake)
      $SEND_KEY KEYCODE_WAKEUP
      ;;
    sleep)
      $SEND_KEY KEYCODE_POWER
      ;;
    up)
      $SEND_KEY KEYCODE_DPAD_UP
      ;;
    down)
      $SEND_KEY KEYCODE_DPAD_DOWN
      ;;
    left)
      $SEND_KEY KEYCODE_DPAD_LEFT
      ;;
    right)
      $SEND_KEY KEYCODE_DPAD_RIGHT
      ;;
    enter)
      $SEND_KEY KEYCODE_ENTER
      ;;
    home)
      $SEND_KEY KEYCODE_HOME
      ;;
    back)
      $SEND_KEY KEYCODE_BACK
      ;;
    play)
      $SEND_KEY KEYCODE_MEDIA_PLAY_PAUSE
      ;;
    pause)
      $SEND_KEY KEYCODE_MEDIA_PLAY_PAUSE
      ;;
    ard)
      $SEND_KEY KEYCODE_WAKEUP
      MAIN=$($ADB -s $IP:$PORT shell pm dump $ARD | grep -A 1 "MAIN" | \
                  grep $ARD | awk '{print $2}' | grep $ARD)
      $ADB -s $IP:$PORT shell am start -n ${MAIN::-1}
      ;;
    zdf)
      $SEND_KEY KEYCODE_WAKEUP
      MAIN=$($ADB -s $IP:$PORT shell pm dump $ZDF | grep -A 1 "MAIN" | \
                  grep $ZDF | awk '{print $2}' | grep $ZDF)
      $ADB -s $IP:$PORT shell am start -n ${MAIN::-1}
      ;;
    esac
    done
