# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=ja_JP.UTF-8

ZSH_THEME="robbyrussell"

fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# User configuration
autoload predict-on
predict-on

#ssh
#export SSH_KEY_PATH="~/.ssh/dsa_id"
#PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"
export PYTHONPATH=/usr/local/Cellar/opencv/2.4.8.9/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:${PATH}

export GNUTERM=aqua

alias -g cdm="cd ~/Dropbox/M1_lecture"
alias -g cvim="cd ~/Dropbox/pub/cvim_jan_2015/cvim_abst"
alias -g gg="open http://google.com"
