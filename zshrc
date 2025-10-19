# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pixie/.zshrc'

autoload -Uz compinit colors vcs_info
compinit
colors
# End of lines added by compinstall
#

# Begin MEGAN CUSTOMIZATION
source ~/.aliases
export PATH=~/scripts:$PATH
export PATH=~/.bin:$PATH

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Basics
export EDITOR=vim
setopt prompt_subst
# # Prompt with git info (branch + dirty/staged marks)
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' formats ' %F{blue}[%b%F{red}%u%F{yellow}%c%f]'
zstyle ':vcs_info:git:*' actionformats ' %F{blue}[%b|%a%F{red}%u%F{yellow}%c%f]'
precmd() { vcs_info }

#
# # GNU ls color (Linux); fallback for macOS
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b 2>/dev/null || true)"
  alias ls='ls --color=auto'
else
  export CLICOLOR=1
  export LSCOLORS=Gxfxcxdxbxegedabagacad   # Solarized-ish; tweak as needed
  alias ls='ls -G'
fi
# Colored grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# ~/.zshrc — minimal, with git in prompt + colored ls/grep
#
# # Basics
# export EDITOR=vim
# setopt prompt_subst
# autoload -Uz colors compinit vcs_info
# colors
# compinit
#
# # Prompt with git info (branch + dirty/staged marks)
# zstyle ':vcs_info:git:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr '+'
# zstyle ':vcs_info:git:*' unstagedstr '!'
# zstyle ':vcs_info:git:*' formats ' %F{blue}[%b%F{red}%u%F{yellow}%c%f]'
# zstyle ':vcs_info:git:*' actionformats ' %F{blue}[%b|%a%F{red}%u%F{yellow}%c%f]'
# precmd() { vcs_info }
#
# PROMPT='%F{green}%n%f@%F{cyan}%m%f %F{magenta}%~%f${vcs_info_msg_0_} %# '
#
# # GNU ls color (Linux); fallback for macOS
# if command -v dircolors >/dev/null 2>&1; then
#   eval "$(dircolors -b 2>/dev/null || true)"
#     alias ls='ls --color=auto'
#     else
#       export CLICOLOR=1
#         export LSCOLORS=Gxfxcxdxbxegedabagacad   # Solarized-ish; tweak as needed
#           alias ls='ls -G'
#           fi
#
#           # Colored grep
#           alias grep='grep --color=auto'
#           alias egrep='egrep --color=auto'
#           alias fgrep='fgrep --color=auto'
#
#           # Quality of life
#           setopt hist_ignore_dups share_history
#           HISTFILE=~/.zsh_history
#           HISTSIZE=5000
#           SAVEHIST=5000
#
#           # Safer defaults
#           setopt noclobber
#           umask 022


# Doom?
export PATH=$PATH:~/.config/emacs/bin

PROMPT='%F{green}%n%f@%F{cyan}%m%f %F{magenta}%~%f${vcs_info_msg_0_} %# '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pixie/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pixie/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/pixie/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pixie/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/pixie/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/pixie/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

[ -f "/home/pixie/.ghcup/env" ] && . "/home/pixie/.ghcup/env" # ghcup-env
# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/pixie/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
