[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
