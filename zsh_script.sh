# Start's the installation
clear

# Go to home
cd ~

# Backup files
rm -rf ~/.nvim_backups
mkdir ~/.nvim_backups

cp -rf ~/.vim ~/.nvim_backups
cp ~/.vimrc ~/.nvim_backups
cp ~/.zshrc ~/.nvim_backups
cp -rf ~/.config/nvim ~/.nvim_backups

echo "Backup complete"

# Copy latest vimrc
cp ~/.config/nvim/.vimrc ~
cp ~/.config/nvim/.zshrc ~

# Get bundle start
cd ~/.config/nvim/pack/bundle/start
git clone https://github.com/junegunn/fzf.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/radenling/vim-dispatch-neovim.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/tpope/vim-obsession.git
git clone https://github.com/tpope/vim-projectionist.git
git clone https://github.com/tpope/vim-unimpaired.git

# Install fzf
~/.config/nvim/pack/bundle/start/fzf/install --bin

cd ~
echo "Setup Complete"
