cd $HOME
[ -d .vim ] && { echo ".vim already exists"; exit 1; }
mkdir .vim
cd .vim
git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload .
rm -rf vim-pathogen
mkdir bundle
cd bundle
git clone --recursive https://github.com/python-mode/python-mode
cd python-mode
git co e3f714b
cd $HOME
ln -s git/base-config/vimrc .vimrc
mkdir .ropeproject
