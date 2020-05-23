BASE=$(pwd)
pushd $HOME

[ -d shell_custom ] && { echo "shell_custom directory already exists"; exit 1; }
[ -r .bash_profile.orig ] && { echo ".bash_profile.orig already exists"; exit 1; }
[ -r .vimrc.orig ] && { echo ".vimrc.orig already exists"; exit 1; }

[ -r .bash_profile ] && mv .bash_profile .bash_profile.orig
ln -s $BASE/custom.sh .bash_profile
mkdir shell_custom
for filename in $BASE/custom/*.sh; do
    ln -s $filename shell_custom/
done

[ -r .vimrc ] && mv .vimrc .vimrc.orig
ln -s $BASE/vimrc .vimrc

[ ! -r .gitconfig ] && .cat $BASE/gitconfig | sed 's/GIT-EMAIL/${GIT_EMAIL:-git-email-here}/' > .gitconfig

[ ! -r .screenrc ] && ln -s $BASE/screenrc .screenrc

[ ! -d bin ] && mkdir bin
[ ! -r bin/gdf ] && ln -s $BASE/gdf bin/gdf

if [ ! -d .fzf ]
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

popd
