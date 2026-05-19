# Editing files:
alias ealias="nvim ~/.aliases_eol ; source ~/.aliases_eol"
alias ealiases="ealias"

# SSH:
if command -v ssh &> /dev/null; then
  alias ss='ssh si'
  alias sshhold="ssh -q -o ServerAliveInterval=90"
  alias sshthold="ssh -q -t -o ServerAliveInterval=90"
  alias ds="sshhold eol-datastore1"
  alias passds="echo 'eol-datastore1' && sshthold eol-datastore1 'sudo passwd jrice'"
  alias eol1="sshhold eol1"
  alias passeol1="echo 'eol1' && sshthold eol1 'sudo passwd jrice'"
  alias eol2="sshhold eol2"
  alias passeol2="echo 'eol2' && sshthold eol2 'sudo passwd jrice'"
  alias node1="sshhold eol-node1"
  alias passnode1="echo 'eol-node1' && sshthold eol-node1 'sudo passwd jrice'"
  alias node2="sshhold eol-node2"
  alias passnode2="echo 'eol-node2' && sshthold eol-node2 'sudo passwd jrice'"
  alias frontend1="sshhold eol-frontend1"
  alias frontend="frontend1"
  alias fe="frontend1"
  alias passfrontend="echo 'eol-frontend1' && sshthold eol-frontend1 'sudo passwd jrice'"
  alias dolo="sshhold dolomedes"
  alias passdolo="echo 'dolomedes' && sshthold dolomedes 'sudo passwd jrice'"
  alias micro="sshhold microdon"
  alias passmicro="echo 'microdon' && sshthold microdon 'sudo passwd jrice'"
  alias enhydra="sshhold enhydra"
  alias passenhydra="echo 'enhydra' && sshthold enhydra 'sudo passwd jrice'"
  alias backend1="sshhold eol-backend1"
  alias backend="backend1"
  alias be="backend1"
  alias passbackend1="echo 'eol-backend1' && sshthold eol-backend1 'sudo passwd jrice'"
  alias backend2="sshhold eol-backend2"
  alias passbackend2="echo 'eol-backend2' && sshthold eol-backend2 'sudo passwd jrice'"
  alias graph="sshhold eol-graph"
  alias passgraph="echo 'eol-graph' && sshthold eol-graph 'sudo passwd jrice'"
  alias passall="passds ; passeol1; passeol2; passnode1; passnode2; passfrontend; passtam; passdolo; passmicro; passenhydra; passbackend1; passbackend2; passgraph; echo 'local:' && sudo passwd jrice ; echo 'YOU ARE DONE AND SHOULD BE BACK HOME, DO NOT EXIT'"
  alias aliasall="echo 'ds' ; scp -q ~/.aliases_eol eol-datastore1:~ ; echo 'eol1' ; scp -q ~/.aliases_eol eol1:~ ; echo 'eol2' ; scp -q ~/.aliases_eol eol2:~ ; echo 'node1' ; scp -q ~/.aliases_eol eol-node1:~ ; echo 'node2' ; scp -q ~/.aliases_eol eol-node2:~ ; echo 'tbank' ; echo 'fe' ; scp -q ~/.aliases_eol eol-frontend1:~ ; echo 'dolo' ; scp -q ~/.aliases_eol dolomedes:~ ; echo 'micro' ; scp -q ~/.aliases_eol microdon:~ ; echo 'enhydra' ; scp -q ~/.aliases_eol enhydra:~ ; echo 'be1' ; scp -q ~/.aliases_eol eol-backend1:~ ; echo 'be2' ; scp -q ~/.aliases_eol eol-backend2:~ ; echo 'graph' ; scp -q ~/.aliases_eol eol-graph:~ ; echo 'YOU ARE DONE'"
  alias versionall="ssh -q eol-datastore1 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol1 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol2 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol-node1 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol-node2 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol-traitbank1 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol-frontend1 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q dolomedes 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q microdon 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q enhydra 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol-backend1 'cat /proc/sys/kernel/hostname /etc/redhat-release'; ssh -q eol-backend2 'cat /proc/sys/kernel/hostname /etc/redhat-release'; echo 'YOU ARE DONE'"
fi

# Where file:
alias where="cat /home/jrice/where.txt"
if [ -t 0 ] && [ -f $HOME/where.txt ]; then
  cat $HOME/where.txt
fi

# Root:
alias sr="sudo su -"

# So you have "aliases" for the following:
# ss -> ssh
# de -> docker exec -it (with other stuff)
# dc -> docker-compose
# pub -> publishing
# harv -> harvesting
# job -> the jobs container
# bpub -> beta publishing
# bharv -> beta harvesting
# sqlharv -> MySQL for harvesting
# sqlpub -> MySQL for publishing
# ssl -> ssl-terminator
# varn -> varnish
# dev -> development
# top -> docker exec -it ... top
# curl -> curl the right port
# clearENVtmp -> delete temp files
# cycleENV -> down and up the docker containers
# tail -> docker exec -it tail -f [log]
# es -> elasticsearch
# log -> docker log

# Rails environment commands:
alias terms='cd ~/code/eol_terms'
alias ssbpub="ssh -t eol-backend1 'sudo su -'"
alias ssharvsql="sshhold -t dolomedes 'sudo su -'"
alias ssbharv="ssh -t eol-frontend1 'sudo su -'"
alias ssbharvsql="sshhold -t eol-backend2 'sudo su -'"
alias ssbwork="sshhold -t eol-backend2 'sudo su -'"
alias sspub="ssh -t eol-datastore1 'sudo su -'"
alias ssmem="ssh -t eol1 'sudo su -'"
alias sses="ssh -t eol2 'sudo su -'"
alias sswork="ssh -t enhydra 'sudo su -'"
alias sssql="ssh -t enhydra 'sudo su -'"
alias ssssl="ssh -t eol-node1 'sudo su -'"
alias ssbssl="ssh -t eol-frontend1 'sudo su -'"
alias ssharv="ssh -t eol-node1 'sudo su -'"
alias ssharvtl="ssh -t eol-node1 'tail -n 4 /data/harvesting_web_log/delayed_job.log'"
alias ssvarn="ssh -t eol-datastore1 'sudo su -'"
alias ssbvarn="ssh -t eol-frontend1 'sudo su -'"
alias ssneo="ssh -t eol-node2 'sudo su -'"
alias ssgraph="ssh -t eol-graph 'sudo su -'"
alias ssbneo="ssh -t microdon 'sudo su -'"
alias cddevpub='cd ~/code/publishing'
alias cddevharv='cd ~/code/harvester'
alias cdbharv='cd /u/apps/harvester/docker'
alias cdpub='cd /u/apps/publishing/docker'
alias cdapp='cd /u/data/docker/publishing/docker'
alias cdharv='cd /u/apps/harvesting/docker'
alias cdbvarn='cd /u/apps/beta_varnish'
alias cdvarn='cd /u/apps/varnish'
alias cdssl='cd /u/apps/ssl-terminator'

# Docker commands:
if command -v docker &> /dev/null; then
  alias dc='docker compose'
  alias dcs='dc stats --no-stream'
  alias dckr='docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it'
  alias debharv='dckr harvesting_web bash'
  alias debjob='dckr pub_jobs bash'
  alias dedevpub='dckr pub_dev_web bash'
  alias dedevharv='dckr harvesting_dev_web bash'
  alias dedevjob='dckr pub_dev_jobs bash'
  alias shharv='dckr docker-app-1 bash'
  alias rcharv='dckr docker-app-1 bundle exec rails c'
  alias shvarn='dckr varnish bash'
  alias shbvarn='dckr beta_varnish bash'
  alias shssl='dckr ssl-terminator bash'
  alias chkvarn='dc exec varnish varnishd -Cf /etc/varnish/default.vcl'
  alias chkbvarn='dc exec beta_varnish varnishd -Cf /etc/varnish/default.vcl'
  alias statvarn='dc exec varnish varnishstat'
  alias statbvarn='dc exec beta_varnish varnishstat'
  alias chkwork='dc exec pub_worker bundle exec rails r "pp Delayed::Job.where(queue: %{harvest})"'
  alias dessl='dckr ssl-terminator bash'
  alias dejob='dckr pub_jobs bash'
  alias topdpub='dckr pub_dev_web top -c'
  alias topdharv='dckr harvesting_dev_web top -c'
  alias toppub='dckr pub_web top -c'
  alias topbharv='topharv'
  alias topbpub='toppub'
  alias topharv='dckr harvesting_web top -c'
  alias curldevpub='curl localhost:3000'
  alias curlpub='curl localhost:3000'
  alias curldevharv='curl localhost:3001'
  alias curlharv='curl localhost:3001'
  alias clearharvtmp='rm -f /data/harvesting_web/tmp/*.sock ; rm -rf /data/harvesting_web/tmp/pids/* ; rm -f /data/harvesting_web/tmp/*.log ; rm -rf /data/harvesting_web/tmp/*.pid'
  alias clearbharvtmp='clearharvtmp'
  alias clearpubtmp='rm -f /eol/tmp/publishing_jobs/*.sock ; rm -rf /eol/tmp/publishing_jobs/pids/* ; rm -f /eol/tmp/publishing_jobs/*.log ; rm -rf /eol/tmp/publishing_jobs/*.pid ; rm -f /eol/tmp/publishing/*.sock ; rm -rf /eol/tmp/publishing/pids/* ; rm -f /eol/tmp/publishing/*.log ; rm -rf /eol/tmp/publishing/*.pid'
  alias clearbpubtmp='clearpubtmp'
  # alias buildwork='cdpub && readenv && dc build --build-arg rails_secret_key=$RAILS_MASTER_KEY --build-arg rails_env=$RAILS_ENV --build-arg traitbank_url=$TRAITBANK_URL --build-arg neo4j_driver_url=$NEO4J_DRIVER_URL --build-arg neo4j_user=$NEO4J_USER --build-arg neo4j_password=$NEO4J_PASSWORD --build-arg eol_github_user=$EOL_GITHUB_USER --build-arg eol_github_email=$EOL_GITHUB_EMAIL'
  alias readenv='set -a && source .env && set +a'
  alias buildassets='cdpub && readenv && dc build app_assets'
  alias buildwork='cdpub && readenv && dc build'
  alias buildpub='buildassets && buildwork'
  alias buildpubnc='buildwork --no-cache && dc cp app:/app/public/packs /data/publishing_web_packs && dc cp app:/app/public/assets /data/publishing_web_assets'
  alias cyclebpub='cdpub && buildwork && dc down && clearbpubtmp && dc up -d && topbpub'
  alias cyclevarn='cdvarn && dc down && dc up -d && dc logs -f varnish'
  alias cyclebvarn='cdbvarn && dc down && dc up -d && dc logs -f beta_varnish'
  alias cyclepub='cdpub && buildwork && dc down && clearpubtmp && dc up -d && toppub && cyclevarn'
  alias cyclebharv='cdbharv ; git pull ; dc build ; dc down ; clearbharvtmp ; dc up -d ; sleep 2 ; topbharv'
  alias cycleharv='cdharv ; dc down ; clearharvtmp ; dc up -d ; sleep 2 ; topharv'
  alias tailbpub='tail -f /data/publishing_web_log/staging.log'
  alias tailbharv='dckr harvesting_web tail -f /app/log/staging.log'
  alias tailneo='dc logs --tail 4 --follow neo4j'
  alias credspub='dc exec app bash -c "export EDITOR=vim && bundle exec rails credentials:edit"'
  alias rcapp='cdpub ; dc exec app bundle exec rails c'
  alias rcwork='cdpub ; dc exec pub_worker bundle exec rails c'
  alias shapp='cdpub ; dc exec app bash'
  alias shwork='cdpub ; dc exec pub_worker bash'
  alias shneo='cdpub ; dc exec neo4j bash'
  alias reswork='cdpub ; dc stop pub_worker && dc rm -f pub_worker && dc create pub_worker && dc start pub_worker && dc logs -f pub_worker'
  alias resdata='cdpub ; dc stop pub_data_worker && dc rm -f pub_data_worker && dc create pub_data_worker && dc start pub_data_worker && dc logs -f pub_data_worker'
  alias resintegrity='cdpub ; dc stop pub_integrity_worker && dc rm -f pub_integrity_worker && dc create pub_integrity_worker && dc start pub_integrity_worker && dc logs -f pub_integrity_worker'
  alias killwork='cdpub; dc exec pub_worker kill -HUP `pgrep ruby`'
  alias shnginx='cdpub ; dc exec nginx bash'
  alias tailnginx='docker exec -it nginx tail -n 100 /var/log/nginx/error.log'
  alias resnginx='cdpub ; docker exec nginx nginx -s reload'
  alias resssl='cdssl ; dc down && dc up -d && dc logs -f ssl-terminator'
  alias resvarn='cdvarn ; dc restart varnish && dc logs -f varnish'
  alias resbvarn='cdvarn ; dc restart beta_varnish && dc logs -f beta_varnish'
  alias downvarn='cdvarn ; dc exec varnish varnishadm vcl.load down /etc/varnish/maintenance.vcl && dc exec varnish varnishadm vcl.use down'
  alias tailpub='tail -f /data/publishing/log/production.log'
  alias tailssl='cdssl && tail -f logs/nginx/*log'
  alias tailwork='cdpub && dc logs pub_worker --tail 200 -f'
  alias tailsql='dc logs mysql --tail 200 -f'
  alias dcl='docker compose logs --tail 2 --follow'
  alias tailharv='dckr harvesting_web tail -f /app/log/staging.log'
  alias tailes='dc logs --tail 2 --follow elastic01'
  alias sqlpub='docker compose exec mysql mysql -uroot -p -A eol_website_production'
  alias sqlharv='docker compose exec mysql mysql -uroot -p -A harvester_production'
fi

# Because in some places it includes a `-W:no-deprecated` that causes errors. This is not a great solution, but I could
# NOT find any file that added that. Anywhere. So I'm doing this.
unset RUBYOPT
