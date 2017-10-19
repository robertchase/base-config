cd $HOME
git clone https://github.com/robertchase/base-config
sh base-config/vimsetup.sh
cd $HOME
cat base-config/gitconfig | sed 's/GIT-EMAIL/${SETUP_GIT_EMAIL:-bob.chase@gmail.com}/' > .gitconfig
ln -s base-config/my_bash_profile .base_aliases
ln -s base-config/screenrc .screenrc
rm .vimrc
ln -s base-config/vimrc .vimrc
mkdir bin
cd bin
ln -s ../base-config/gdf .
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
