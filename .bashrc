alias resrc="source ~/.bashrc"
alias gc="git checkout -t -b"

sk () {
 echo "alias $1=\"$2\"" >> ~/.bashrc && resrc
}

sf () {
 echo "$1 () {
 $2
}" >> ~/.bashrc && resrc
}

mb () {
 gc "tchordia-$1-ci"
}

mbc () {
 gc "tchordia-console-$1-ci"
}

alias prof="vim ~/.bashrc"
alias t0="tmux a -t 0"


export VISUAL=nvim
export EDITOR="$VISUAL"

alias vimrc="vim ~/.vimrc"
alias gp="git pull --rebase"
alias tmuxconf="vim ~/.tmux.conf"
gsr () {
 git grep -l "$1" | xargs sed -i "s/$1/$2/g"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
