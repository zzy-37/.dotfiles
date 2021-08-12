# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH=$HOME/script:$PATH

# Deepin Wine
if [ -e $HOME/.deepinwine ] ;then
    PATH=$HOME/.deepinwine/deepin-wine6-stable/bin:$PATH
    export WINEPREFIX=$HOME/.deepinwine/Deepin-WeChat
fi

# Install Ruby Gems to ~/.local/share/gems
if [ -e $HOME/.local/share/gems ] ;then
    export GEM_HOME=$HOME/.local/share/gems
    PATH=$HOME/.local/share/gems/bin:$PATH
fi

# Set proxy
host_ip=127.0.0.1
# get host ip address if is wsl
[ $WSLENV ] && host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export http_proxy="http://$host_ip:10809"
export https_proxy="http://$host_ip:10809"
export no_proxy="apple.com"

# Set Visual Editor
export VISUAL=vim
