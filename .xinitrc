DEFAULTSESSION=xmonad# | dzen

case "$1" in
    xmonad ) exec xmonad | dzen ;;
    i3 ) exec i3
        *) exec $DEFAULTSESSION ;;
esac
