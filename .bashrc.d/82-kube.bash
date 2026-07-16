if command -v kubectl >/dev/null 2>&1; then
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/jrice.key"
  [[ $- == *i* ]] && kubectl config use-context eol-staging

  alias ealiask="vim ~/.bashrc.d/82-kube.bash ; source ~/.bashrc.d/82-kube.bash"
  
  alias ea="cd ~/code/kubecfg"
  alias eap="cd ~/code/kubecfg/publishing"

  alias kc="kubectl"
  alias kcc="kc config"
  alias kpods="kc get pods -o wide"
  alias kcani="kc auth can-i"

  alias kapp="ea && kc apply -k publishing/overlays/staging"
  alias kappprod="ea && kc apply -k publishing/overlays/prod"
  alias kstat="ea && kc rollout status deploy/publishing-nginx"
  alias krestart="kc -n eol-staging rollout restart deploy/publishing-web"

  alias kdesc="kc describe pod"
  alias klog="kc logs"
  alias klogprev="klog --previous"
  alias kstat="echo \"NOTE: you'll need to add 'sts/' before the name of the resource (not the pod).\" && echo \"---\" && kc rollout status"

  alias kclear="rm -rf ~/.kube/cache/" # Clears the cache.
  alias kcontext="kcc get-contexts" # Also kcc current-context, but this is more info.
  alias kcontextprod="kcc use-context eol-prod"
  alias kcontextstage="kcc use-context eol-staging"
  alias ksetcontext="kubectl config use-context"

  krc() {
  kc exec -it "deploy/$1" -- sh -c '
    export RAILS_MASTER_KEY="$(cat "$RAILS_MASTER_KEY_FILE")"
    export NEO4J_USER="$(cat "$NEO4J_USER_FILE")"
    export NEO4J_PASSWORD="$(cat "$NEO4J_PASSWORD_FILE")"
    bundle exec rails c
  '
  }

  alias kwork="krc publishing-worker"

  alias kupneosecrets="sops --decrypt overlays/staging/neo4j-secrets.sops.yaml | kc apply -f -"
  alias kuppubsecrets=" sops --decrypt overlays/staging/publishing-secrets.sops.yaml | kc apply -f -"
  alias kupsecrets="kupneosecrets && kuppubsecrets"

  alias comaliask="pushd ~ ; git add ~/.bashrc.d/82-kube.bash ; git ci ; git push ; popd"
fi
