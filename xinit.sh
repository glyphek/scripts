#!/bin/sh

tryexec() {
	while true
	do
		if "$@"&
		then
			break
		fi
	done
}

while true
do
	tryexec redshift
	tryexec picom
	tryexec pipewire-pulse
	tryexec wireplumber
	tryexec xwallpaper --stretch "$WALLPAPER"
	tryexec dwmstatus
	tryexec xidle -delay 5 -sw -program '/bin/slock' -timeout 300
	dbus-run-session dwm
done
