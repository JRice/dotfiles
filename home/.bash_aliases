#!/bin/bash
# ^ For syntax highlighting.

alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias dc="cd"
alias top="top -o cpu"
alias eol='cd ~/git/eol;clear'
alias vol='cd ~/eol-vagrant; vagrant ssh'
alias tram="cd ~/tramea"
alias eolphp='cd ~/git/eol_php_code'
alias ggr='git grep -n --color'
alias epopulate="rake eol:db:populate"
alias ereset="rake eol:reset RAILS_ENV=test"
alias work="rake resque:work QUEUE='*'"

alias dbm="rake db:migrate && rake db:migrate RAILS_ENV=test && rake db:migrate RAILS_ENV=test_master"
alias rakess="rake eol:site_specific repo=git@github.com:mbl-cli/eol-private.git"
alias mt='git mergetool'
alias gcp='git cherry-pick'
# Used when cherry-picking, and mergetool changes are successful:
alias ccp='git clean -f; git commit -m "Merge after cherry-pick"; git push'
alias z='cd ~/eol-vagrant && vagrant ssh --command "cd ~/git/eol; zeus"'
alias sc='eol;rails c'
# Zeus:
alias zc='eol;zeus c'
alias zss="cd ~/git/eol; zeus rake solr:start"
alias zs="cd ~/git/eol; zeus rake solr:start && zeus s"
alias zv="cd /usr/local/virtuoso-opensource/var/lib/virtuoso/db;virtuoso-t;eol;zeus start"
# Last tag, usu. the one to deploy:
alias lasttag='git tag | grep "^[0-9]\{4\}\.[0-9][0-9]\.[0-9][0-9]\.[0-9][0-9]$" | sort | tail -n 1'
alias nexttag="lasttag | ruby -e 'puts STDIN.read.sub(/(\d\d)$/) { |m| sprintf(%q{%02d}, \$1.to_i + 1) } '"
# Homesick editing:
alias ealias='homesick pull dotfiles && homesick exec dotfiles vim home/.bash_aliases && homesick commit dotfiles && homesick push dotfiles && source ~/.bash_aliases'
alias evim='homesick pull dotfiles && homesick exec dotfiles vim home/.vimrc && homesick commit dotfiles && homesick push dotfiles'
alias ebash='homesick pull dotfiles && homesick exec dotfiles vim home/.bashrc && homesick commit dotfiles && homesick push dotfiles && source ~/.bashrc'
alias egit='homesick pull dotfiles && homesick exec dotfiles vim home/.gitconfig && homesick commit dotfiles && homesick push dotfiles'
# Vagrant:
alias vip="vagrant ssh -c \"ip address show eth0 | grep 'inet ' | sed -e 's/^.*inet //' -e 's/\/.*$//'\""
# Chef:
alias rcstat='cd ~/chef/rc && knife status'
alias mblstat='cd ~/chef/mbl && knife status'
# SSH aliases:
alias varn='ssh eol-cache1.rc.fas.harvard.edu'
alias stage='ssh eol_staging_deploy@staging.eol.org'
alias bocce='ssh eol_staging_deploy@bocce.eol.org'
alias beast='ssh eol-thebeast.rc.fas.harvard.edu'
alias harvesting="ssh eol-thebeast.rc.fas.harvard.edu 'ps -efaw | grep php | grep harvest_resources_cron_task.php$'"
alias backup='ssh -t backup1.core.cli.mbl.edu "cd /backup && bash"'
alias virt='ssh eol-virt01.rc.fas.harvard.edu'
# PHP:
alias phpt="echo '** Running PHP Tests...' && cd ~/git/eol;rake solr:start;cd ~/git/eol_php_code; php tests/run_tests.php | tee ~/p | grep '^Exception '"
# Virtuoso:
alias virtu="cd /usr/local/virtuoso-opensource/var/lib/virtuoso/db;virtuoso-t"
alias virtusql="cd /usr/local/virtuoso-opensource; ./bin/isql 1111 dba dba"
alias bill="cd ~/bin && ruby calc_bills.rb"

function gcp() {
  git cherry-pick $1;
  git mergetool;
}

function capbocce() {
  git pull;
  git rebase -i @{u};
  git push;
  git tag $1;
  git push --tags;
  rake eol:site_specific;
  cap bocce_demo unicorn:stop;
  cap bocce_demo deploy -S tag=$1
  echo "Tag: $1";
}

function capstage() {
  git pull;
  git rebase -i @{u};
  git push;
  git tag $1;
  git push --tags;
  rake eol:site_specific;
  cap staging unicorn:stop;
  cap staging deploy -S tag=$1
  echo "Tag: $1";
}

function just_branch() {
  git branch $1;
  git push origin $1;
  git branch -D $1;
  git checkout $1;
  git tag $1.01;
}
function branch() {
  just_branch $1;
  capbocce $1.01;
}

function app() {
  ssh eol-app$1.rc.fas.harvard.edu
}

if [ -f $HOME/.bash_aliases_local ]; then
  source $HOME/.bash_aliases_local
fi
