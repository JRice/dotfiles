if command -v kubectl >/dev/null 2>&1; then
  alias ghauth="gh auth login --hostname github.com --web --scopes write:packages,read:packages"
  export GH_USER="$(gh api user --jq .login)"
  alias ghdock="gh auth token | docker login ghcr.io -u '$GH_USER' --password-stdin"
fi
