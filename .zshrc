# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joey/.zshrc'

autoload -Uz promptinit
promptinit
# End of lines added by compinstall
PS1='%B%M %F{cyan}%2~ %F{green}-> %F{white}%b'

#export PATH=$PATH:"/Users/joey/dev/clang+llvm-9.0.0-x86_64-darwin-apple/bin"
export PATH=$PATH:"/opt/homebrew/opt/llvm/bin"
export SHELL="/usr/bin/zsh"

#export FZF_DEFAULT_COMMAND='rg —-files -—hidden'
export FZF_DEFAULT_COMMAND='find .'

export SHELL=/bin/zsh

# others
alias ls="ls -la --color=auto"
alias vim='nvim'
#alias clang-format="/Users/joey/dev/clang+llvm-9.0.0-x86_64-darwin-apple/bin/clang-format"
