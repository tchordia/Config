export FNAME="$0"
export DOTFILE_CONFIG_DIR=`dirname "$0"`
export VISUAL=nvim
export EDITOR="$VISUAL"
export RAW_NVIM_CONFIG="~/.config/nvim/init.vim"
export NVIM_CONFIG="$DOTFILE_CONFIG_DIR/nvimconfig.vim"
export TMUX_CONFIG="$DOTFILE_CONFIG_DIR/tmux.conf"
export BASE_CONFIG="$HOME/.zshrc"
export PATH=$PATH:$HOME/bin
export ANYSCALE_DEBUG=1
export ANYSCALE_PRODUCT_DIR="$HOME/product"

alias resrc="source $BASE_CONFIG && conda activate anyscale"
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
    gpbd "$@";
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
alias com="git add . && git commit -a --no-verify"
alias gitbranch="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"


af () {
 if [ -z "$1" ]
 then
   gitbranch
 else
   local branch="tchordia/$1"
   local existed_in_local=$(git branch --list ${branch})
   local target="tchordia/$2"
   if [ -z "$2" ]
   then
     target="origin/master"
   fi
   echo ${branch}
   echo ${existed_in_local}
   if [ -z ${existed_in_local} ]
   then
     git fetch && git checkout "$target" && git checkout -b "${branch}" && git branch -u origin/master
   else
     git checkout ${branch}
   fi
 fi
}

alias opr='hub pr show -h $(br)'
# conda activate anyscale
alias cdp="cd ~/product"
export ANYSCALE_LOCAL_PROXY_URL="https://console.anyscale-staging.com"
alias bopenapi="/Users/tanmay/product/scripts/test/run-lint.sh --build-open-api"
alias zshrc="vim /Users/tanmay/.zshrc"

alias devkill="tmux kill-session -t anyscale && anyscale down"
alias devup="anyscale up --config session-default.yaml --disable-sync"
alias dev="tmuxp load anyscale"
alias devstart="devup && dev"
alias devrestart="devkill && devstart"

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
 pushd $HOME/product/frontend/web && "$@"; popd
}

alias lintflake8="flake8 --exclude=backend/server/schemas.py backend --quiet"
alias pyimport="lintflake8 | tee >(xargs isort  -p anyscale -p backend -p dashboard --conda-env anyscale --honor-noqa --profile google) >(xargs autoflake --remove-unused-variables   --remove-all-unused-imports -i)"
alias pylintall="pyimport && pylint && lintflake8"
alias nla="pushd $HOME/product/frontend/web && npm run lint-fix && npm test && npx cypress run; popd"
alias nt="inweb npm t"

alias nl="inweb npm run lint-fix"
alias toweb="pushd $HOME/product/frontend/web"

onmaster () {
  echo "https://github.com/anyscale/product/blob/master/$1#L$2"
}

pytests () {
  TEST_CLOUD_NAME=anyscale_default_cloud ANYSCALE_HOST=`anyurl` ANYSCALE_CLI_TOKEN="$1" python -m pytest tests/e2e/release/test_builds.py --tb=long -ra -s --cli-token "$1" --host `anyurl`
}
alias k="kubectl"
alias addrelease="git commit  --allow-empty -m '[RELEASE] test'"
alias localcli="pip install -e /Users/tanmay/product/frontend/cli"
loginas () {
 echo $@
 alias anyscale="$@ anyscale"
}
alias rerun='git commit --allow-empty -m "[DELAY_CLEANUP] rerun again"'
alias anyinstall="pip install -e $HOME/product/frontend/cli"
alias bapi="inweb npm run build-api"
alias rayinstall='pip install -U `python -m anyscale.connect required_ray_version`'
alias pyimportclear="autoflake --remove-unused-variables   --remove-all-unused-imports -i -r"
alias pnp="cdp && python start.py anyscale-product:8 --session-name pnp"
alias prodcom="grep 'image:.*product' tools/kubernetes/production/anyscaleproduct.yaml | tail -c 41"
alias cdw="cdp && cd frontend/web"
alias cany="conda deactivate && conda activate anyscale"
alias signpy='sudo codesign --force --deep --sign - `which python`'
alias anyenv="env | grep 'ANYSCALE'"
alias pr="gh pr create"
alias gl="git log"
pcred () {
 cmd=`asdev premerge credentials $1`
 echo "Setting env"
 echo "$cmd"
 echo "$cmd" | source /dev/stdin
}
alias rename="git commit --amend"
lw () {
 echo "$1" |  tr '[:upper:]' '[:lower:]'
}
alias pjr="kubens production-job-resources"

# aws describe images aws ec2 describe-images \
#    --filters "Name=name,Values=anyscale-default-*1.11.0rc1*" \
#    --output text --region us-west-2
alias alog="aws sso login --profile"
alias cda="cd ~/asdev"
alias ldev="aws"
alias lprod="aws"
paws () {
 asdev aws activate $@ | . /dev/stdin;
}
kaws () {
 paws $@ &&  asdev kube activate $1
}

alias dcp="asdev kube activate premerge"

alias bko="open 'https://buildkite.com/anyscale/premerge/builds?branch='\"$(git symbolic-ref HEAD --short)\""
alias gps="git spr update"
pc () {
 num=${1-1}
 next_num=$(($num + 1))
 pre-commit run -s HEAD~$next_num  --to-ref HEAD~$num
}
