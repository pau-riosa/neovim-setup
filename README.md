# Summary

Neovim setup

This guide is built for Mac only.

# Prerequisites

Make sure your machine has the following installed:
- XCode
- HomeBrew


# Installation


1. Install RG
```
brew install rg
```

2. Install Neovim
```
brew install neovim
```
3. Clone repo 
```
mkdir ~/.config
git clone git@gitlab.com:jethro.riosa/neovim-setup.git ~/.config/nvim
```

# for bash_script
4. Run `~/.config/nvim/script.sh`
5. then run `source ~/.zshrc`

# for zsh_script
install ZSH first
run `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"` 
4. Run `~/.config/nvim/zsh_script.sh`
5. then run `source ~/.zshrc`


# Usage
Simply call the command `vim | vi | nvim` to open the editor.

# Shortcut keys
`<leader>` key is `space bar`

1. Open Nerdtree: `<leader>n`
2. Find within file: `<leader>f`

Saving session is useful if you want to go back to the previous state of your work after you close vim. Just call `vim -S` to initiate the session. Don't push the `Session.vim` in git in case its not yet in `.gitignore`.
3. Record session of work: `<leader>r`
4. Delete session of work: `<leader>rt`

4. Open terminal within Vim. This is useful if you want to save a session of the state of the terminal within neovim.
```
<leader>tv open terminal in vertical split
<leader>ts open terminal in horizontal split
```
5. Rename file: `<leader>j`

# TroubleShooting

1. open your terminal
2. run `vim`
3. if you see errors like `minpac#init`

4. run `git clone git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac`


# Other Setup
1. add this to `~/.zshrc` for Martide Development Setup 
``

alias ms="iex -S mix phx.server"

alias rr="mix ecto.reset && mix ecto.realistic"

alias rd="mix ecto.reset && mix ecto.demo"

alias wd="webdriver-manager start --versions.chrome=78.0.3904.97"

alias dr="docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.4.1"

``

