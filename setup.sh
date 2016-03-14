cd $HOME
git clone https://github.com/robertchase/base-config
sh base-config/vimsetup.sh
cd $HOME
cat base-config/gitconfig | sed 's/git@tympanum.org/bchase@streetshares.com/' > .gitconfig
ln -s base-config/my_bash_profile .base_aliases
ln -s base-config/screenrc .screenrc
rm .vimrc
ln -s base-config/vimrc .vimrc
mkdir bin
cd bin
ln -s ../base-config/gdf .
