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

if [ -f $HOME/.bash_aliases_local ]; then
  source $HOME/.bash_aliases_local
fi
