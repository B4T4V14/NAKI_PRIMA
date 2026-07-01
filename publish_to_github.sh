#!/bin/bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <github-repo-url>"
  echo "Example: $0 https://github.com/username/naki-monitor-pages.git"
  exit 1
fi

REPO_URL="$1"

cd "$(dirname "$0")"

if [[ ! -d .git ]]; then
  git init -b main
fi

if ! git remote | grep -q '^origin$'; then
  git remote add origin "$REPO_URL"
else
  git remote set-url origin "$REPO_URL"
fi

git add .
if ! git diff --cached --quiet; then
  git commit -m "Update GitHub Pages content"
fi

git push -u origin main

echo "Done: pushed to $REPO_URL"
echo "Next: enable GitHub Pages in repository settings (branch: main, folder: /(root))"
