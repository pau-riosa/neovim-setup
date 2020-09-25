
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jethroriosa/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
# )


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/jethroriosa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PATH="/usr/local/sbin:$PATH"

# Use Neovim as "preferred editor"
export VISUAL=nvim

# shortcuts
# Use Neovim instead of Vim or Vi
alias vim=nvim
alias vi=nvim
alias nv=nvim
alias gs="git status --short"
alias go="git checkout "
alias ga="git add "
alias gp="git push -u origin "
alias gl="git pull origin "
alias gc="git commit "
alias gh="git lg"
alias gf="git fetch"
alias glu="git pull upstream"

alias ms="iex -S mix phx.server"
alias rr="mix ecto.reset && mix ecto.realistic"
alias rd="mix ecto.reset && mix ecto.demo"

# run npm install -g webdriver-manager
# webdriver-manager clean
# webdriver-manager update
# webdriver-manager start
alias wd="webdriver-manager start --versions.chrome=78.0.3904.70"
alias dr="docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.4.1"

alias l="ls -a"
alias f="xdg-open"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash


source ~/zsh-git-prompt/zshrc.sh GIT_PROMPT_ONLY_IN_REPO=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
PROMPT=$'%[\033[0;32m\]🔥\ %{${fg[yellow]}%}%~%b $(git_super_status) %[\033[0;32m\]🔥\ \n%T %[\033[0;32m\]🤙\ ' 

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex" # this loads kiex

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

export PYTHON_PATH="/Users/jethroriosa/Library/Python/3.7/bin"
export PATH=$PYTHON_PATH:$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin:

export FZF_DEFAULT_COMMAND='rg --files'
# Neovim terminal
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then 
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim='echo "No nesting!"' 
  fi
fi

