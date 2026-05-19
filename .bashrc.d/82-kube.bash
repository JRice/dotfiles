export KUBECONFIG=~/.kube/eol-developer.kubeconfig
export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
kubectl config use-context eol-dev

alias kc="kubectl get"
alias kcc="kubectl config"
alias kpod="kubectl get pods"

alias kcontext="kcc get-contexts" # NOT NEEDED: ; kcc current-context"
