SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

#tmux
rm -f "${HOME}"/.prettierrc
ln -s "$BASEDIR"/.prettierrc "${HOME}"/.prettierrc

#tmux
rm -f "${HOME}"/.tmux.conf
ln -s "$BASEDIR"/.tmux.conf "${HOME}"/.tmux.conf

#i3
rm -rf "${HOME}"/.config/i3
ln -s "$BASEDIR"/i3 "${HOME}"/.config/i3
rm -rf "${HOME}"/.config/i3status
ln -s "$BASEDIR"/i3status "${HOME}"/.config/i3status

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
