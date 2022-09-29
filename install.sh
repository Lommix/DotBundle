SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

#tmux
rm -f "${HOME}"/.tmux.conf
ln -s "$BASEDIR"/.tmux.conf "${HOME}"/.tmux.conf

#nvim
rm -rf "${HOME}"/.config/nvim
ln -s "$BASEDIR"/nvim "${HOME}"/.config/nvim

#kitty
rm -rf "${HOME}"/.config/kitty/kitty.conf
ln -s "$BASEDIR"/kitty.conf "${HOME}"/.config/kitty/kitty.conf

#vimrc
rm -f "${HOME}"/.vimplugin.vim
ln -s "$BASEDIR"/.vimplugin.vim "${HOME}"/.vimplugin.vim

echo "cloning tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
