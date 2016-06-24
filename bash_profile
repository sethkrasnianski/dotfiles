# Allowing vim key binding
set -o vi

#### GENERAL PATHS ####
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local/sbin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PGDATA=/usr/local/var/postgres
export CLOJURESCRIPT_HOME="/user/local/clojurescript"

## Folder highlights
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#### ALIASES ####
alias serve="python -m SimpleHTTPServer 3838"
alias irc="irssi"
alias lorem-ipsum="lorem-ipsum --units words --count 100 --copy --format html"
alias vim="mvim -v"
alias spacemacs="emacs -nw"

## TOOLS ##
alias ngrok="~/ngrok"
alias to_json="python -m json.tool"
alias tree="tree -I 'node_modules|bower_components'"

## Git ##
alias pull="git pull" # pull staging
alias push="git push" # push staging
alias gcam="git commit -am" # gcam "yo cat"
alias gcm="git commit -m" # gcm "yo dawg"
alias gcamd="git commit --amend" # amend the commit
alias gs="git status"
alias gb="git branch"
alias gbD="git branch -D"
alias ga="git add" # ga path/to/file/name
alias gA="git add --all"
alias gd="git diff" # gd **OR** gd /path/to/file/name
alias gdf="git show --pretty="format:" --name-only" # gdf {SHA}
alias gl="git log"
alias gr="git remote"
alias grv="git remote -v"
alias gra="git remote add" # gra remote-repo-name
alias grrm="git remote rm" # grrm remote-repo-name
alias gcb="git checkout -b" # gcb cutting-edge-branch
alias gc="git checkout" # gc existing-branch
alias gm="git merge" # gm some-branch-into-current-head
alias grb="git rebase"
alias gri="git rebase -i" # gri {SHA}
alias grigm="git rebase -i github/master" # gri {SHA}
alias grim="git rebase -i origin/master" # gri {SHA}
alias griohshit="git rebase -i --root $tip" # in case you mess up the first commit of a repo
alias grc="git rebase --continue" # continue on with the rebase
alias grs="git rebase --skip" # ehhh skip it
alias grA="git rebase --abort" # get out of there!!!
alias grh="git reset head"
alias grH="git reset head --hard"
alias grh^="git reset head^"
alias fetchgithub="git fetch github"
alias fetch="git fetch"
alias blame="git blame"
alias stash="git stash"
alias stashapply="git stash apply"
alias cherrypick="git cherry-pick"

#### GIT ####
## Git detailed output
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

PS1="☃ $GREEN\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

## Git checkout fuzzy
function gcf() {
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")

}

function push-up() {
    git push --set-upstream origin $(git branch | grep ^* | sed 's/* //')
}

#### HELPER FUNCTIONS ####
# run command n times
run() {
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}

#### Clojurescript ####
export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"

#### Boot2Docker ####
# $(boot2docker shellinit)
alias boot2dockerup="DOCKER_TLS_VERIFY=1 DOCKER_HOST=tcp://192.168.59.103:2375 DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm boot2docker up"

#### RVM ####
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
