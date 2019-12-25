# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory beep extendedglob nomatch
unsetopt autocd notify
# End of lines configured by zsh-newuser-install

setopt hist_ignore_dups hist_ignore_space

bindkey -e

# Alias definitions.
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'
alias symbolz='gcc -fno-asynchronous-unwind-tables -S -O0 -x c -o /dev/stdout'

# Enable color support of ls and also add handy aliases
# Mac OS and FreeBSD don't support --color flag for ls and use -G instead.
if [[ `uname` = "Darwin" || `uname` = "FreeBSD" ]]
then
  alias ls='gls --color=auto --hide='\''*.pyc'\'''
  eval `gdircolors ~/.dir_colors`
  alias rm='grm -I'
  alias mkpassword='echo $(grep -v -E "^[A-Z]|'\''|.{9,}" /usr/share/dict/words | gshuf -n 4 | tr "\n" "-")$(gshuf -i 1-9 -n 1)'
else
  alias ls='ls --color=auto --hide='\''*.pyc'\'''
  eval `dircolors ~/.dir_colors`
  alias rm='rm -I'
  alias mkpassword='echo $(grep -v -E "^[A-Z]|'\''|.{9,}" /usr/share/dict/words | shuf -n 4 | tr "\n" "-")$(shuf -i 1-9 -n 1)'

  # Handy clipboard functions
  alias inclip='xclip -sel clipboard'
  alias outclip='xclip -sel clipboard -out'

  # Specific settings for my Dell XPS 13 9350
  alias screenunscale='gsettings set org.gnome.desktop.interface scaling-factor 1 && gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'\''Gdk/WindowScalingFactor'\'', <1>}]" && gnome-session-quit --no-prompt'
  alias screenscale='gsettings set org.gnome.desktop.interface scaling-factor 2 && gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'\''Gdk/WindowScalingFactor'\'', <2>}]" && gnome-session-quit --no-prompt'
  alias audiofix='amixer -c 0 cset '\''numid=10'\'' 1 numid=10,iface=MIXER,name='\''Headphone Mic Boost Volume'\'' > /dev/null'
  alias audiofix2='amixer -c 2 cset '\''numid=10'\'' 1 numid=10,iface=MIXER,name='\''Headphone Mic Boost Volume'\'' > /dev/null'
fi

alias grep='grep --color=auto'

PROMPT="%F{yellow}%n@%m:%F{blue}%~ %F{red}⇒%f "

# Get coloring in man pages
man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

alias cdd='\cd'
function cdandls () { cdd $1 && ls }
alias cd='cdandls'

alias overwrite='\mv'
alias mv='\mv -i'

alias cpp='\cp'
alias cp='cpp -ri'


alias canon='cdd $(pwd -P)'

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"
# Hide output after git log and git less
export LESS=-R

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

source "${HOME}/.zgen/zgen.zsh"
zgen load zsh-users/zsh-syntax-highlighting

fpath[1,0]=~/.zsh_completion/

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
