[ -f "$HOME/.timezone" ] && . "$HOME/.timezone"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -r "$HOME/.config/redshift.conf" ] && redshift &

xautolock -time 5 -secure -locker 'i3lock -c 123456' &

xset b off
xset c 0

exec x-window-manager
