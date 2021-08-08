setopt autocd              # change directory just by typing its name
setopt promptsubst         # enable command substitution in prompt

setopt autopushd

# Add my shell function folder to fpath
fpath=("$ZDOTDIR/functions" "$fpath[@]")
fpath=("/usr/share/doc/zsh/examples/Functions" "$fpath[@]")

# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1

# Load the theme
# custom themes are defined in functions directory
prompt mytheme2

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v
bindkey "^?" backward-delete-char

# Keep 1000 lines of history within the shell and save it to ~/.cache/zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh_history

# Use modern completion system
autoload -Uz compinit
compinit -d ~/.cache/zcompdump

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable fzf keybindings for Zsh:
[ -e /usr/share/doc/fzf/examples/key-bindings.zsh ] && . /usr/share/doc/fzf/examples/key-bindings.zsh

# enable fuzzy auto-completion for Zsh:
[ -e /usr/share/doc/fzf/examples/completion.zsh ] && . /usr/share/doc/fzf/examples/completion.zsh

# enable syntax-highlighting
[ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable auto-suggestions based on the history
[ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# enable command-not-found if installed
[ -e /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

# Source plugins
for plug in $ZDOTDIR/*.plugin.zsh; . $plug

# source my custom shell settings
. ~/.shrc
