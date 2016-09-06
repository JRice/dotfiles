#!/bin/bash
# ^ For syntax highlighting.

alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias dc="cd"
alias top="top -o cpu"
alias eol='cd ~/git/eol;clear'

alias web='cd ~/git/eol_website;clear'
alias solrup='web && rake sunspot:solr:start'
alias solrdown='web && rake sunspot:solr:stop'
alias rc='web && rails c'
alias rs='web && rails s'

alias eolp='cd ~/git/eol_php_code;clear'
alias eolphp='eolp'
alias vol='cd ~/eol-vagrant; vagrant ssh'
alias tram="cd ~/tramea"
alias ggr='git grep -n --color'
alias epopulate="rake eol:db:populate"
alias ereset="rake eol:reset RAILS_ENV=test"
alias work="rake resque:work QUEUE='*'"

alias dbm="rake db:migrate && rake db:migrate RAILS_ENV=test && rake db:migrate RAILS_ENV=test_master"
alias rakess="rake eol:site_specific repo=git@github.com:mbl-cli/eol-private.git"
alias mt='git mergetool'
alias ctag='ctags --exclude=.git --exclude=tags --exclude=logs --exclude=doc --exclude=public --exclude=app/assets/javascripts --exclude=generate/vendor -R . $(bundle list --paths)'
# Git tricks:
alias gcp='git cherry-pick'
alias branch_todo='git diff master | grep "^\(+.*TODO\|+++\)" | grep -B1 "TODO"'
# Used when cherry-picking, and mergetool changes are successful:
alias ccp='git clean -f; git commit -m "Merge after cherry-pick"; git push'
# Virtuoso:
alias virtu="cd /usr/local/Cellar/virtuoso/7.2.1/bin ; virtuoso-t"
alias virtusql="cd /usr/local/Cellar/virtuoso/7.2.1/bin ; ./bin/isql 1111 dba dba"
alias bill="ruby ~/bin/calc_bills.rb"
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
# SSH aliases:
alias ss='ssh si'
alias si='ss'
# PHP:
alias phpt="echo '** Running PHP Tests...' && cd ~/git/eol;rake solr:start;cd ~/git/eol_php_code; php tests/run_tests.php | tee ~/p | grep '^Exception '"
# Restarts:
alias rebocce="cap bocce_demo unicorn:stop unicorn:start"
alias proxy="~/bin/proxy.sh"

export EOL_DEVEL_DB_USERNAME="root"
export EOL_DEVEL_DB_PASSWORD=""
export EOL_TRAITBANK_URL="http://neo4j:4ConnectingDots@localhost:7474"

function gcp() {
  git cherry-pick $1;
  git mergetool;
}

if [ -f $HOME/.bash_aliases_local ]; then
  source $HOME/.bash_aliases_local
fi
