if command -v kubectl >/dev/null 2>&1; then
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/jrice.key"
  # Only switch if the context actually exists on this machine.
  if [[ -o interactive ]] && kubectl config get-contexts -o name 2>/dev/null | grep -qx eol-staging; then
    kubectl config use-context eol-staging
  fi

  alias ealiask='$EDITOR ~/.zshrc.d/82-kube.zsh ; source ~/.zshrc.d/82-kube.zsh'

  alias ea="cd ~/code/kubecfg"
  alias eap="cd ~/code/kubecfg/publishing"

  alias kc="kubectl"
  alias kcc="kc config"
  alias kpods="kc get pods -o wide"
  alias kcani="kc auth can-i"

  alias kapp="ea && kc apply -k publishing/overlays/staging"
  alias kappprod="ea && kc apply -k publishing/overlays/prod"
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
  kubectl exec -it "deploy/$1" -- sh -c '
    export RAILS_MASTER_KEY="$(cat "$RAILS_MASTER_KEY_FILE")"
    export NEO4J_USER="$(cat "$NEO4J_USER_FILE")"
    export NEO4J_PASSWORD="$(cat "$NEO4J_PASSWORD_FILE")"
    bundle exec rails c
  '
  }

  alias kwork="krc publishing-worker"

  alias kupneosecrets="sops --decrypt overlays/staging/neo4j-secrets.sops.yaml | kc apply -f -"
  alias kuppubsecrets="sops --decrypt overlays/staging/publishing-secrets.sops.yaml | kc apply -f -"
  alias kupsecrets="kupneosecrets && kuppubsecrets"

  alias comaliask="pushd ~ ; git add ~/.zshrc.d/82-kube.zsh ; git ci ; git push ; popd"
fi
