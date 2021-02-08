export FNAME="$0"
export DOTFILE_CONFIG_DIR=`dirname "$0"`
export VISUAL=nvim
export EDITOR="$VISUAL"
export RAW_NVIM_CONFIG="~/.config/nvim/init.vim"
export NVIM_CONFIG="$DOTFILE_CONFIG_DIR/nvimconfig.vim"
export TMUX_CONFIG="$DOTFILE_CONFIG_DIR/tmux.conf"
export BASE_CONFIG="$HOME/.zshrc"

alias resrc="source $BASE_CONFIG"
alias prof="$EDITOR $FNAME"
alias vimrc="$EDITOR $NVIM_CONFIG"
alias tmuxconf="$EDITOR $TMUX_CONFIG"
alias gc="git checkout -t -b"

sk () {
 echo "alias $1=\"$2\"" >> $FNAME && resrc
}

sv () {
 echo "export $1=\"$2\"" >> $FNAME && resrc
}

svs () {
 echo "export $1=\"$2\"" >> $BASE_CONFIG && resrc
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

alias br="git symbolic-ref HEAD --short"
alias gpbd="git push origin \`git symbolic-ref HEAD --short\`"
alias cdd="cdr && cd www/demo"
alias sta="git status"

gpbfunc () {
  branch=`git symbolic-ref HEAD --short`;
  if [[ $branch == "master" ]]
  then
    echo "on master";
  else
    echo "not on master";
    gpbd "$@";
  fi
}

alias gpb="gpbfunc"
alias ss="python -m SimpleHTTPServer"
alias trm="git branch -u origin/master"
alias grc="git rebase --continue"

alias master="git checkout master"
alias gl="git log"
alias gri="git rebase -i origin/master"
alias vim="nvim"
alias com="git commit -a -m"
alias gitbranch="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"


af () {
 if [ -z "$1" ]
 then
   gitbranch
 else
   local branch="tchordia-$1"
   local existed_in_local=$(git branch --list ${branch})
   echo ${branch}
   echo ${existed_in_local}
   if [ -z ${existed_in_local} ]
   then
     git fetch && git checkout origin/master && git checkout -b tchordia-$1 && git branch -u origin/master
   else
     git checkout ${branch}
   fi
 fi
}

alias opr='hub pr show -h $(br)'
conda activate anyscale
alias cdp="cd ~/product"
export ANYSCALE_LOCAL_PROXY_URL="https://anyscale.dev"
alias bopenapi="/Users/tanmay/product/scripts/test/run-lint.sh --build-open-api"
alias zshrc="vim /Users/tanmay/.zshrc"

alias devrestart="tmux kill-session -t anyscale && anyscale down && anyscale up && tmuxp load anyscale"
alias devstart="anyscale up --config session-default.yaml && tmuxp load anyscale"
alias dev="tmuxp load anyscale"
parseTable () {
  awk 'FNR == '"$1"' {print $'"$2"'}'
}

anyurl () {
  anyscale list ips | parseTable 2 2 | xargs -I % echo "http://%:5000" 
}

anyopen () {
  anyurl | xargs open
}

anyext () {
  anyurl | xargs -I % open "%/ext/v0/docs"
}

anydocs () {
  anyurl | xargs -I % open "%/api/v2/docs"
}

alias pylint="./scripts/test/run-lint.sh"
alias am="git commit -a --amend --no-edit"
inweb () {
 pushd frontend/web && "$@"; popd
}

alias lintflake8="flake8 --exclude=backend/server/schemas.py backend --quiet"
alias pyimport="lintflake8 | tee >(xargs isort  -p anyscale -p backend -p dashboard --conda-env anyscale --honor-noqa --profile google) >(xargs autoflake --remove-unused-variables   --remove-all-unused-imports -i)"
alias pylintall="pyimport && pylint && lintflake8"
alias nla="pushd frontend/web && npm run lint-fix && npm test; popd"
alias nt="inweb npm t"

alias nl="inweb npm run lint-fix"
alias toweb="pushd frontend/web"
