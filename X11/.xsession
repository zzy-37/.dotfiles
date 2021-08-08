#!/bin/sh

# export LC_ALL="zh_CN.utf8"
export LANG=zh_CN.UTF-8

# switch Capslock and Escape
xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock"
xmodmap -e "keycode 66 = Escape"

# enable tapping and natural scrolling for trackpad
xinput set-prop 12 343 1    # Enable Taapping
xinput set-prop 12 325 1    # Enable Natural Scrolling
xinput set-prop 12 354 0, 1 # Enable Click Finger
# xinput set-prop 12 341 3, 3 # Set Drag Lock Buttom for Right Cilck

# set input method
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
GDK_DPI_SCALE=2 ibus-daemon -rxd

# Hidpi scale
export QT_SCALE_FACTOR=2
export GDK_SCALE=2

# settings for java and processing
export PATH=$XDG_DATA_HOME/processing-4.0a3:$PATH
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# use dpass as sudo -A prompt
export SUDO_ASKPASS=~/script/dpass

~/script/dwmstatus.sh &
hsetroot -cover ~/Pictures/wallpapers/gruvbox-lines.png
# ~/script/switch-wallpaper.sh &
sxhkd &
clipmenud &
dunst &

exec dwm

# Run dwm in a loop
# while true; do
#     # Log stderror to a file 
#     dwm 2> ~/.cache/dwm.log
#     # No error logging
#     #dwm >/dev/null 2>&1
# done
