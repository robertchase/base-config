cd $HOME
[ -d .vim ] && { echo ".vim already exists"; exit 1; }
mkdir .vim
cd .vim
git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -rf vim-pathogen
mkdir bundle
cd bundle
git clone https://github.com/klen/python-mode.git
cd $HOME
ln -s git/base-config/vimrc .vimrc
mkdir .ropeproject
