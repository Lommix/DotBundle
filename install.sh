SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")


rm -f "${HOME}"/.tmux.conf
ln -s "$BASEDIR"/.tmux.conf "${HOME}"/.tmux.conf

#nvim
rm -f "${HOME}"/.config/nvim/init.vim
rm -f "${HOME}"/.config/nvim/plugin/coc.vim

ln -s "$BASEDIR"/nvim/init.vim "${HOME}"/.config/nvim/init.vim
ln -s "$BASEDIR"/nvim/plugin/coc.vim "${HOME}"/.config/nvim/plugin/coc.vim
