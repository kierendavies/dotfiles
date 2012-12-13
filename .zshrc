zstyle :compinstall filename '/home/kieren/.zshrc'
autoload -Uz compinit
compinit

# History
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Bindings
bindkey -e
bindkey '[3~' delete-char
bindkey 'OH' beginning-of-line
bindkey 'OF' end-of-line

# Prompt
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

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi