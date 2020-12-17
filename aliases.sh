export FNAME="$0"
export CONFIG_DIR=`dirname "$0"`
export VISUAL=nvim
export EDITOR="$VISUAL"
export RAW_NVIM_CONFIG="~/.config/nvim/init.vim"
export NVIM_CONFIG="$CONFIG_DIR/nvimconfig.vim"
export TMUX_CONFIG="$CONFIG_DIR/tmux.conf"

alias resrc="source $FNAME"
alias prof="$EDITOR $FNAME"
alias vimrc="$EDITOR $NVIM_CONFIG"
alias tmuxconf="$EDITOR $TMUX_CONFIG"
alias gc="git checkout -t -b"

sk () {
 echo "alias $1=\"$2\"" >> $FNAME && resrc
}

sf () {
 echo "$1 () {
 $2
}" >> $FNAME && resrc
}

mb () {
 gc "tchordia-$1-ci"
}

mbc () {
 gc "tchordia-console-$1-ci"
}

alias t0="tmux a -t 0"
alias gp="git pull --rebase"

gsr () {
 git grep -l "$1" | xargs sed -i "s/$1/$2/g"
}

alias gpbd="git push origin -f \`git symbolic-ref HEAD --short\`"
af () {
 if [ $# -eq 0 ]
   then
     arc feature
 else
   arc feature tchordia-console-$1
 fi
}
alias cdd="cdr && cd www/demo"
alias sta="git status"
alias al="arc land"
gpbfunc () {
  branch=`git symbolic-ref HEAD --short`;
  if [[ $branch == "master" ]]
  then
    echo "on master";
  else
    echo "not on master";
    gpbd;
  fi
}

alias gpb="gpbfunc"
alias adp="ad && gpb"
alias ss="python -m SimpleHTTPServer"
alias trm="git branch -u origin/master"
alias grc="git rebase --continue"

alias master="git checkout master"
alias gl="git log"
alias gri="git rebase -i origin/master"
alias vim="nvim"
alias com="git commit -a -m"
