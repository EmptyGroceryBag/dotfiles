# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob prompt_subst
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/joey/.zshrc'

autoload -Uz promptinit
promptinit
# End of lines added by compinstall

# Don't exit when test fails
setopt NO_NOMATCH

function set_git_prompt() {
  CUR_BRANCH=$(git branch --show-current 2>/dev/null || return)

  # If rebasing or merging, git branch --show-current will return nothing
  # Note: The following tests don't work with out the (#q) glob qualifier
  if [[ -d .git/rebase*(#q) ]]; then
    GIT_PROMPT='%F{magenta}%Brebasing%F{white}%b'
    return
  elif [[ -d .git/merge*(#q) ]]; then
    GIT_PROMPT='%F{magenta}%Bmerging%F{white}%b'
    return
  fi

  CUR_STATUS=$(git status -s 2>/dev/null)
  if [[ -z $CUR_STATUS ]]; then
    GIT_PROMPT="%F{green}$CUR_BRANCH%F{white}"
  else
    GIT_PROMPT="%F{red}$CUR_BRANCH%F{white}"
  fi
}

function set_prompt() {
  set_git_prompt
  PS1="%F{cyan}%B%M %F{white}%2~%b $GIT_PROMPT> "
}

add-zsh-hook precmd set_prompt

export SHELL=/bin/zsh
export FZF_DEFAULT_COMMAND='find .'

# MacOS customizations
# alias llvm-clang='/opt/homebrew/opt/llvm@15/bin/clang'
# alias 'llvm-clang++'='/opt/homebrew/opt/llvm@15/bin/clang++'
# export PATH="/opt/homebrew/opt/llvm/bin:/Users/joey/bin:/Users/joey/bin/vscode.app/Contents/Resources/app/bin:$PATH"

# alias ls='ls -la --color=auto'
# alias vim='/opt/homebrew/bin/nvim'
