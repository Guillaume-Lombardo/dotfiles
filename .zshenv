# XDG paths
export XDG_DESKTOP_DIR="$HOME/Media/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Media/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Media/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Media/Public"
export XDG_DOCUMENTS_DIR="$HOME/Media/text"
export XDG_MUSIC_DIR="$HOME/Media/music"
export XDG_PICTURES_DIR="$HOME/Media/images"
export XDG_VIDEOS_DIR="$HOME/Media/video"

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Other Other XDG paths
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export ZSHZ_DATA="$XDG_CONFIG_HOME"/zsh
export DOTBARE_DIR="$XDG_CONFIG_HOME"/.gitbare
export DOTBARE_TREE="$HOME"
export ZSH="$ZSHZ_DATA"/.oh-my-zsh

# Disable files
export LESSHISTFILE=-

# Fixing Paths
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export GOPATH="$XDG_DATA_HOME"/go
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Default Apps
export EDITOR="nvim"
export VISUAL="nvim"
export CODEEDITOR="nvim"
export READER="zathura"
export TERMINAL="alacritty"
export COLORTERM="truecolor"
export PAGER="less"
export WM="i3wm"
export VIDEO="mpv"
export IMAGE="sxiv"
export BROWSER="firefox"
export OPENER="xdg-open"

export CM_SELECTIONS="clipboard"
export CM_DEBUG=0
export CM_OUTPUT_CLIP=1
export CM_MAX_CLIPS=10

export NNN_CONTEXT_COLORS='1234'

