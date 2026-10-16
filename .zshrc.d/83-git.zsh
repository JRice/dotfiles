if command -v gh >/dev/null 2>&1; then
  alias ghauth="gh auth login --hostname github.com --web --scopes write:packages,read:packages"
  # Looked up on demand instead of at every shell start (it's a network call).
  ghdock() {
    : ${GH_USER:=$(gh api user --jq .login)}
    export GH_USER
    gh auth token | docker login ghcr.io -u "$GH_USER" --password-stdin
  }
fi
