[ -f "$HOME/.timezone" ] && . "$HOME/.timezone"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -r "$HOME/.config/redshift.conf" ] && redshift &

xset b off
xset c 0
xset s 180

xss-lock -q -- i3lock -c 123456 &

TRACKPOINT_DEV='TPPS/2 IBM TrackPoint'
if xinput list | grep -q "${TRACKPOINT_DEV}"; then
    xinput set-prop "${TRACKPOINT_DEV}" 'Evdev Wheel Emulation' 1
    xinput set-prop "${TRACKPOINT_DEV}" 'Evdev Wheel Emulation Button' 2
    xinput set-prop "${TRACKPOINT_DEV}" 'Evdev Wheel Emulation Timeout' 200
    xinput set-prop "${TRACKPOINT_DEV}" 'Evdev Wheel Emulation Axes' 6 7 4 5
fi
TOUCHPAD_DEV='SynPS/2 Synaptics TouchPad'
if xinput list | grep -q "${TOUCHPAD_DEV}"; then
    xinput disable "${TOUCHPAD_DEV}"
fi

[ -f "$HOME/.xsession.local" ] && . "$HOME/.xsession.local"

exec x-window-manager
