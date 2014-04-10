#!/bin/bash
# ^ For syntax highlighting.

alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias dc="cd"
alias c="clear"
alias e="exit"
alias ..="cd .."
alias sg="./script/generate"
alias ss="./script/server"
alias bd="open ~/tm/biodiversity.tmproj"
alias gn="open ~/tm/gni.tmproj"
alias tm='open ~/tm/taxamatch.tmproj'
alias e='open ~/tm/eol.tmproj'
alias lev='open ~/tm/levenshtein_playground.tmproj'
alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gd="git diff | mate"
alias gl="git pull"
alias gp="git push"
alias gst="git status"
alias svim="screen -t vim 1 vim"
alias sr="screen -r"
alias devpush='git push origin +dev'
alias dl="cd ~/dl;clear;ls"
alias tmp="cd ~/tmp;clear"
alias hl="heroku logs"
alias sel_test='cd ~/code/eol && time rake test:acceptance:web'
alias eol='cd ~/code/eol;clear'
alias eolphp='cd ~/code/eol_php_code'
alias ggr='git grep -n --color'
alias grdebug='git grep -n --color -l "^ *debugger"| grep -v vendor'
alias epopulate="rake eol:db:populate"
alias erebuild="rake eol:db:rebuild ; rake eol:db:recreate RAILS_ENV=test ; rake eol:db:recreate RAILS_ENV=test_master"
alias gni="cd ~/code/gni;clear"
alias sp="./script/spec"
alias 19='rvm 1.9.2-p290; echo "activating ruby 1.9.2"'
alias 18='rvm 1.8.7;echo "activating ruby 1.8.7"'
alias ctags="`brew --prefix`/bin/ctags"
alias work="rake resque:work QUEUE='*'"

alias dbm="rake db:migrate ; rake db:migrate RAILS_ENV=test ; rake db:migrate RAILS_ENV=test_master"
alias rakess="rake eol:site_specific repo=git@github.com:mbl-cli/eol-private.git";
alias sp="rescue rspec spec/models/ spec/controllers/ spec/helpers/ spec/lib/ spec/views/"
alias zs="zeus test spec/models/ spec/controllers/ spec/helpers/ spec/lib/ spec/views/"
alias top="top -o cpu"
alias mt='git mergetool'
alias gcp='git cherry-pick'
# Used when cherry-picking, and mergetool changes are successful:
alias ccp='git clean -f; git commit -m "Merge after cherry-pick"; git push'
alias restage='cap staging unicorn:stop ; cap staging unicorn:stop ; cap staging deploy:restart'
alias rebocce='cap bocce_demo unicorn:stop ; cap bocce_demo unicorn:stop ; cap bocce_demo deploy:restart'
alias eol='cd ~/eol'
alias z='cd ~/eol; zeus start'
alias sc='eol;rails c'
alias zc='eol;zeus c'
alias en='eol;vim config/translations/en.yml'
alias guard='eol;bundle exec guard'
alias newtodos='git diff master | grep "+.*TODO"'
# Last tag, usu. the one to deploy:
alias lasttag='git tag | grep "^[0-9]\{4\}\.[0-9][0-9]\.[0-9][0-9]\.[0-9][0-9]$" | sort | tail -n 1'
alias nexttag='lasttag | ruby -e \'puts STDIN.read.sub(/(\d\d)$/) { |m| "#{sprintf "%02d", $1.to_i + 1}" }\''
# Edit aliases:
alias ealias='pushd ~/dotfiles/home/ ; git pull ; vim .bash_aliases ; git add .bash_aliases ; git commit ; git push ; homesick pull ; popd ; source ~/.bash_aliases'

# Vagrant aliases:
alias vip="vagrant ssh -c \"ip address show eth0 | grep 'inet ' | sed -e 's/^.*inet //' -e 's/\/.*$//'\""
alias vreup='vagrant destroy --force && vagrant up'

# Chef:
alias rcstat='cd ~/chef/rc ; knife status'
alias mblstat='cd ~/chef/mbl ; knife status'

# SSH aliases:
alias app1="ssh eol-app1.rc.fas.harvard.edu"
alias app2="ssh eol-app2.rc.fas.harvard.edu"
alias app3="ssh eol-app3.rc.fas.harvard.edu"
alias app4="ssh eol-app4.rc.fas.harvard.edu"
alias app5="ssh eol-app5.rc.fas.harvard.edu"
alias app6="ssh eol-app6.rc.fas.harvard.edu"
alias app7="ssh eol-app7.rc.fas.harvard.edu"
alias app8="ssh eol-app8.rc.fas.harvard.edu"
alias app9="ssh eol-app9.rc.fas.harvard.edu"
alias app10="ssh eol-app10.rc.fas.harvard.edu"
alias app11="ssh eol-app11.rc.fas.harvard.edu"
alias app12="ssh eol-app12.rc.fas.harvard.edu"
alias app24="ssh eol-app24.rc.fas.harvard.edu"
alias app26="ssh eol-app26.rc.fas.harvard.edu"
alias stage='ssh eol_staging_deploy@staging.eol.org'
alias bocce='ssh eol_staging_deploy@bocce.eol.org'
alias stagesolr='ssh root@128.128.170.4'
alias beast='ssh eol-thebeast.rc.fas.harvard.edu'
alias services='ssh services.eol.org'
alias app1='echo Should just get in; ssh eol-app1'
alias backup='ssh -t backup1.core.cli.mbl.edu "cd /backup ; bash"'

alias p="echo '** Running PHP Tests...' ; cd ~/eol;rake solr:start;cd ~/php_code; php tests/run_tests.php | tee ~/p | grep '^Exception '"
alias s="rails s"
alias zs="cd ~/eol; zeus rake solr:start ; zeus s"
alias c="rails c"
# I know this is weird, having it run in the foreground, but then backgrounding it... but it puts the output in the right place:
alias virtu="cd /usr/local/virtuoso-opensource/var/lib/virtuoso/db;virtuoso-t +foreground &"
alias virtusql="cd /usr/local/virtuoso-opensource; ./bin/isql 1111 dba dba"
alias bill="cd ~/bin ; ruby calc_bills.rb"

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

if [ -f $HOME/.bash_aliases_local ]; then
  source $HOME/.bash_aliases_local
fi
