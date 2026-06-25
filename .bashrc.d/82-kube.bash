if command -v kubectl >/dev/null 2>&1; then
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/jrice.key"
  [[ $- == *i* ]] && kubectl config use-context eol-staging

  alias ealiask="vim ~/.bashrc.d/82-kube.bash ; source ~/.bashrc.d/82-kube.bash"
  
  alias ea="cd ~/code/kubecfg"
  alias eap="cd ~/code/kubecfg/publishing"

  alias kc="kubectl"
  alias kcc="kc config"
  alias kpod="kc get pods"
  alias kcani="kc auth can-i"
  alias kapp="ea && kc apply -k publishing/overlays/staging"
  alias kstat="ea && kc rollout status deploy/publishing-nginx"
  alias kres="kc -n eol-staging rollout restart deploy/publishing-web"

  alias kcontext="kcc get-contexts" # NOT NEEDED: ; kcc current-context"

  krc() {
  kubectl -n eol-staging exec -it deploy/publishing-web -- sh -c '
    export RAILS_MASTER_KEY=$(cat /run/secrets/publishing/RAILS_MASTER_KEY)
    export NEO4J_USER=$(cat /run/secrets/publishing/NEO4J_USER)
    export NEO4J_PASSWORD=$(cat /run/secrets/publishing/NEO4J_PASSWORD)
    exec bundle exec rails console
  '
  }

  alias kupneosecrets="sops --decrypt overlays/staging/neo4j-secrets.sops.yaml | kc apply -f -"
  alias kuppubsecrets=" sops --decrypt overlays/staging/publishing-secrets.sops.yaml | kc apply -f -"
  alias kupsecrets="kupneosecrets && kuppubsecrets"
fi
