## install neovim
https://github.com/neovim/neovim/wiki/Installing-Neovim

## install something for plugins

pip3 install --user pynvim

### mac
brew install fzf  
brew install ag

### linux
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt-get install silversearcher-ag


## install plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## copy init.vim

## change init.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nvim
:PlugInstall
