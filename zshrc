# source '/blah/blah/zshrc'

eval "$(dircolors -b)"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colorize outputs
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

HISTFILE=~/.zsh_history
SAVEHIST=1000

export TERM="xterm-256color"
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Improved X11 forwarding through GNU Screen (or tmux).
#   If not in screen or tmux, update the DISPLAY cache.
#   If we are, update the value of DISPLAY to be that in the cache.
function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display
    else
        export DISPLAY=`cat ~/.display`
    fi
}
# This is run before every command.
preexec() {
    # Don't cause a preexec for PROMPT_COMMAND.
    # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
    #[ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return 
    update-x11-forwarding
    # Debugging.
    #echo DISPLAY = $DISPLAY, display file = `cat ~/.display`, STY = $STY, TMUX = $TMUX  
}
#trap 'preexec' DEBUG

function proc() {
    ps aux | grep -v 'grep --color=auto' | grep $1
}
function vim-plug() {
    mkdir -p ~/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim \
      https://raw.github.com/junegunn/vim-plug/master/plug.vim
}

# Aliases
alias rootmount='echo mount\ -o\ remount,rw\ 0\ /'
alias installrpm='rpm -ivh'
alias installtar='tar -zxvf'
alias sshserv='sudo rcsshd restart'
alias cycleplasma='kquitapp5 plasmashell && kstart plasmashell'
alias color256='for code ({000..255}) print -P -- "$code: %F{$code}\u2588\u2588\u2588\u2588 These are colors!%f"'

alias o="kde-open"
alias swd='pwd > ~/Scripts/shell/wd'
alias lwd='dir=$(cat ~/Scripts/shell/wd); cd $dir'
alias clip='xsel -ib'

alias capsoff="setxkbmap -layout us -option caps:escape"
alias capson="setxkbmap -layout us -option"
