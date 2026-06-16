if command -v kubectl >/dev/null 2>&1; then
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/jrice.key"
  [[ $- == *i* ]] && kubectl config use-context eol-staging

  alias ealiask="vim ~/.bashrc.d/82-kube.bash ; source ~/.bashrc.d/82-kube.bash"
  
  alias ea="cd ~/code/kubecfg"
  alias eap="cd ~/code/kubecfg/publishing"

  alias kc="kubectl get"
  alias kcc="kubectl config"
  alias kpod="kubectl get pods"
  alias kcani="kubectl auth can-i"
  alias kapp="kubectl apply -k overlays/staging"
  alias kres="kubectl -n eol-staging rollout restart deploy/publishing-web"

  alias kcontext="kcc get-contexts" # NOT NEEDED: ; kcc current-context"

  alias kupneosecrets="sops --decrypt overlays/staging/neo4j-secrets.sops.yaml | kubectl apply -f -"
  alias kuppubsecrets=" sops --decrypt overlays/staging/publishing-secrets.sops.yaml | kubectl apply -f -"
  alias kupsecrets="kupneosecrets && kuppubsecrets"
fi
