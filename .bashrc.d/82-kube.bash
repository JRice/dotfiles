if command -v kubectl; then
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
  kubectl config use-context eol-dev

  alias ealiask="vim ~/.bashrc.d/82-kube.bash ; source ~/.bashrc.d/82-kube.bash"

  alias kc="kubectl get"
  alias kcc="kubectl config"
  alias kpod="kubectl get pods"
  alias kcani="kubectl auth can-i"

  alias kcontext="kcc get-contexts" # NOT NEEDED: ; kcc current-context"
fi
