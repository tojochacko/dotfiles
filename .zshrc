# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games


#Short Command Aliases
alias 'ld=ls -dl */'
alias 's=ssh'
alias 'py=python'
alias 'gsup=git-smart-pull'
alias 'gsl=git-smart-log'
alias 'gscommit=git show --pretty="format:" --name-only'
alias 'sv=sudo vim'
alias 'size=du -sh *'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function gvim () { (/usr/bin/gvim -f "$@" &) }


alias l="ls -GlAh --color"
alias ls="ls --color=auto -Fh --group-directories-first"
alias latest="ls -lct1"
alias ltree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias clls="clear;ls -Glah --color"
#alias grep='grep --colour=auto'
alias diff='colordiff'
alias dt='dmesg | tail'
alias dh='df -h'
alias dm='df -m'
alias x='startx'
alias bc='bc -l'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias ae="sudo $EDITOR /etc/apt/sources.list"
alias aL="dpkg -L"
alias muc="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"
