alias ealiaspa="$EDITOR ~/.zshrc.d/81-andover.zsh ; source ~/.zshrc.d/81-andover.zsh"
alias oldec="cd ~/code/academycompass"
alias ec="cd ~/code/educompass"
alias amp="cd ~/code/amplify"
alias rs="bundle exec rspec"
# Set up a local server on port 5000 (OSX can't do concurrency):
alias rserv="WEB_CONCURRENCY=0 bin/rails server -p 5000"

# Get database URLs, for connecting to pg directly:
alias ampdburl="heroku config:get DATABASE_URL -a andovermath"
alias ecdburl="heroku config:get DATABASE_URL -a academycompass"

# Consoles!
alias rcec="ec && heroku run rails console -a academycompass"
alias rcecs="ec && heroku run rails console -a educompass-staging"
alias rcamp="ec && heroku run rails console -a andovermath"
alias rcamps="ec && heroku run rails console -a amplify-staging"
alias shec="ec && heroku run bash -a academycompass"
alias shecs="ec && heroku run bash -a educompass-staging"
alias shamp="ec && heroku run bash -a andovermath"
alias shamps="ec && heroku run bash -a amplify-staging"

alias dbecs="heroku pg:psql STAGING_DB -a educompass-staging"
alias dbamps="heroku pg:psql STAGING_DB -a amplify-staging"

# Logs!
alias logec="heroku logs --tail -a academycompass --dyno router"
alias logecs="heroku logs --tail -a educompass-staging --dyno router"
alias logamp="heroku logs --tail -a andovermath --dyno router"
alias logamps="heroku logs --tail -a amplify-staging --dyno router"

# Deploy-related:
alias depecs="cd ~/code/educompass && git push origin main && git push staging main"
alias maintec="heroku maintenance:on --app academycompass"
alias maintoffec="heroku maintenance:off --app academycompass"
alias releasesec="heroku releases --app academycompass"
alias rollbackec="heroku rollback --app academycompass" # You should probably specify a version

# Up/Down:
alias upecs="heroku ps:scale web=1 --app educompass-staging"
alias downecs="heroku ps:scale web=0 --app educompass-staging"
alias upamps="heroku ps:scale web=1 --app amplify-staging"
alias downamps="heroku ps:scale web=0 --app amplify-staging"
