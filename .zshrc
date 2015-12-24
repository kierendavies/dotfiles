zstyle :compinstall filename '/home/kieren/.zshrc'

# History
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=* l:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _expand _complete _correct _approximate

# Bindings
bindkey -e
bindkey '[3~' delete-char
bindkey 'OH' beginning-of-line
bindkey '[1~' beginning-of-line
bindkey '[7~' beginning-of-line
bindkey 'OF' end-of-line
bindkey '[4~' end-of-line
bindkey '[8~' end-of-line
bindkey '[5~' up-line-or-history
bindkey '[6~' down-line-or-history
bindkey '[1;5D' emacs-backward-word
bindkey 'Od' emacs-backward-word
bindkey '[1;5C' emacs-forward-word
bindkey 'Oc' emacs-forward-word

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
PROMPT='%(?..%B%{%F{yellow}%}%?%1v%{%f%}%b )%{%F{red}%}%n%{%f%}@%{%F{green}%}%m%{%f%}:%{%F{blue}%}%~%{%f%}${vcs_info_msg_0_}%# '

# Aliases
alias rm="rm -i"
alias ls="ls --color"
alias ll="ls -lah"
eval $(thefuck --alias)
