# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory beep extendedglob nomatch
unsetopt autocd notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

printf '\nfpath=($HOME/.homesick/repos/homeshick/completions $fpath)' >> $HOME/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Above is auto-generated stuff ###

# Make sure we are running interactively, else stop
[ -z "$PS1" ] && return

setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE

bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" backward-kill-line

# Alias definitions.
alias killz='killall -9 '
alias hidden='ls -a | grep "^\..*"'
alias rm='rm -I'
alias shell='ps -p $$ -o comm='
alias sml='rlwrap sml'
alias math='rlwrap MathKernel'
alias coin='rlwrap coin'
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'
alias gcc122='gcc -Wall -Wextra -Werror -Wstrict-prototypes -Wshadow -std=c99 -pedantic'
alias gcc122_d='gcc -Wall -Wextra -Werror -Wstrict-prototypes -Wshadow -std=c99 -pedantic -ggdb'
alias clubticketcheck='klist | grep -q krbtgt/CLUB.CC.CMU.EDU@CLUB.CC.CMU.EDU'
alias andrewticketcheck='klist | grep -q krbtgt/ANDREW.CMU.EDU@ANDREW.CMU.EDU'
alias clubkl='clubticketcheck || kinit -l 24h $USER@CLUB.CC.CMU.EDU && aklog club.cc.cmu.edu'
alias andrewkl='andrewticketcheck || kinit -l 24h $USER@ANDREW.CMU.EDU && aklog andrew.cmu.edu'
alias symbolz='gcc -fno-asynchronous-unwind-tables -S -O0 -x c -o /dev/stdout'
alias mkpassword='grep -v "'\''" /usr/share/dict/cracklib-small | grep -v "^[A-Z]" | egrep -x ".{1,8}" | shuf -n 4 | tr "\n" "-"; shuf -i 1-9 -n 1'

# Enable color support of ls and also add handy aliases
# Mac OS and FreeBSD don't't support --color flag for ls and use -G instead.
if [[ `uname` = "Darwin" || `uname` = "FreeBSD" ]]
then
  alias ls='ls -G -I '\''*.pyc'\'''
else
  alias ls='ls --color=auto -I '\''*.pyc'\'''
fi

alias grep='grep --color=auto'

PROMPT="%F{yellow}%n@%m:%F{blue}%~ %F{red}⇒%f "

eval `dircolors ~/.dir_colors`

unset SSH_ASKPASS

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

alias canon='cdd $(pwd -P)'

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# Turn off the ability for other people to message your terminal using wall
mesg n

if [ $(df . | tail -n 1 | awk '{print $1}') = "AFS" ]
then
  source .zshrc_andrew
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
