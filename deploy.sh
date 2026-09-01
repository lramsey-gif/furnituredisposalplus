#!/bin/bash
# deploy.sh - one-command deploy for Furniture Disposal Plus
# Usage: ./deploy.sh /path/to/batch-folder "Commit message"
#
# It copies a batch folder into the repo, stages, shows status,
# checks for unexpected deletions, then commits and pushes.
# No inline comments are echoed into your shell, so it cannot trigger
# the zsh quote> trap.

set -e

REPO="$HOME/Downloads/furnituredisposalplus"
BATCH="$1"
MSG="$2"

if [ -z "$BATCH" ] || [ -z "$MSG" ]; then
  echo "Usage: ./deploy.sh /path/to/batch-folder \"Commit message\""
  echo "Example: ./deploy.sh ~/Downloads/citybatch3 \"Add 10 city pages\""
  exit 1
fi

if [ ! -d "$BATCH" ]; then
  echo "ERROR: batch folder not found: $BATCH"
  exit 1
fi

echo "==> Copying batch into repo"
cp -R "$BATCH"/. "$REPO"/

cd "$REPO"

echo "==> Staging"
git add -A

echo "==> Checking for unexpected deletions"
if git status --porcelain | grep -q '^ *D'; then
  echo ""
  echo "STOP. Deleted files detected. Nothing has been committed."
  echo "Review these before continuing:"
  git status --porcelain | grep '^ *D'
  echo ""
  echo "If the deletions are intentional, run the git commit and push yourself."
  exit 1
fi

echo "==> Files staged:"
git status --porcelain

echo ""
echo "==> Committing"
git commit -m "$MSG"

echo "==> Pushing"
git push

echo ""
echo "Done. Netlify is deploying. Check furnituredisposalplus.netlify.app in a minute."
