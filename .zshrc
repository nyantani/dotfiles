# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="mortalscumbag"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cp="cp -i"
alias mv="mv -i"
alias httpd="sudo /Applications/MAMP/Library/bin/httpd -k"
alias mamp="/Applications/MAMP/"
alias fishing='cd ~/git/fishing'
alias mysql='/Applications/MAMP/Library/bin/mysql -uroot -proot'
alias fishdb='/Applications/MAMP/Library/bin/mysql -uroot -proot -Dexplosion_fishing'
alias refreshdb="$HOME/git/fishing/protected/tools/refreshLocalDb.sh"
alias j="autojump"

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
plugins=(git autojump osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=/Applications/MAMP/bin/php/php5.4.4/bin:$HOME/dotfiles:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$HOME/.phpenv/bin:$HOME/bin:$PATH
export PATH=$HOME/.rbenv/:$HOME/dotfiles:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/local/bin:/opt/local/sbin:$HOME/.phpenv/bin:$HOME/bin:$PATH

# alias php="/Applications/MAMP/bin/php/php5.4.4/bin/php"

# renv
eval "$(rbenv init - zsh)"

# phpenv
eval "$(phpenv init -)"
source ~/perl5/perlbrew/etc/bashrc

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
unalias j
