# Use Neovim as "preferred editor"
export VISUAL=nvim

# Use Neovim instead of Vim or Vi
alias vim=nvim
alias vi=nvim

alias gs="git status --short"
alias go="git checkout "
alias ga="git add "
alias gp="git push -u origin "
alias gl="git pull origin "
alias gc="git commit "
alias gh="git lg"
alias gf="git fetch"
alias glu="git pull upstream"

alias l="ls -a"
alias f="xdg-open"
source ~/.bash-git-prompt/gitprompt.sh GIT_PROMPT_ONLY_IN_REPO=1

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin:/Users/ngdelcastillo/Library/Python/3.7/bin

export FZF_DEFAULT_COMMAND='rg --files'

# Neovim terminal
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then 
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim='echo "No nesting!"' 
  fi
fi
