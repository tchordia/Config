DNAME="$(dirname $(realpath $0))"
NVIM_CONFIG="$HOME/.config/nvim"

 echo "source $DNAME/aliases.sh" >> ~/.zshrc
 echo "Updated $HOME/.zshrc"
 
 mkdir -p "$NVIM_CONFIG"
 echo "source $DNAME/nvimconfig.vim" >> $NVIM_CONFIG/init.vim
 echo "Updated $NVIM_CONFIG/init.vim"

echo "source-file $DNAME/tmux.conf" >> $HOME/.tmux.conf
echo "Updated $HOME/.tmux.conf"
