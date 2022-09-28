#!/bin/sh

[ -f ~/.config/clipit/disabled ] && exit 0

DISTRO="Debian"

if [ -f /etc/os-release ]
then
    . /etc/os-release
    DISTRO="${NAME% GNU/Linux}"
fi

zenity --info --title="ClipIt has been deprecated" --width=500 --window-icon=/usr/share/icons/hicolor/scalable/apps/clipit-trayicon.svg --text="ClipIt has been deprecated and is no longer supported in $DISTRO.

Diodon, a supported replacement for ClipIt, has been automatically installed for your convenience.

Please note that the user settings have not been migrated. You can still access them in <tt>~/.config/clipit/clipitrc</tt>."

if [ -f ~/.config/autostart/clipit-startup.desktop ]
then
    sed -i "s,X-GNOME-Autostart-enabled=.*,X-GNOME-Autostart-enabled=false," ~/.config/autostart/clipit-startup.desktop
fi

mkdir -p ~/.config/clipit

echo "ClipIt has been disabled and replaced by Diodon." > ~/.config/clipit/disabled
