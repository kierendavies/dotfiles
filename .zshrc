# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kieren/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -U colors && colors

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
       '{%F{cyan}%b%f|%F{yellow}%a%f}'
zstyle ':vcs_info:*' formats       \
       '{%F{cyan}%b%f}'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git hg svn
precmd () { vcs_info }

PROMPT='%{%F{red}%}%n%{%f%}@%{%F{green}%}%m%{%f%}:%{%F{blue}%}%~%{%f%}${vcs_info_msg_0_}%# '
