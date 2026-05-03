#!/bin/bash

# 1. Check if a commit message was provided
if [ -z "$1" ]
then
  echo "Error: Please provide a commit message."
  echo "Usage: ./push.sh \"Your commit message\""
  exit 1
fi

# 2. Show current status
echo "--- Current Git Status ---"
git status -s

# 3. Add all changes
echo "Staging changes..."
git add .

# 4. Commit changes
echo "Committing changes..."
git commit -m "$1"

# 5. Get the name of the current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 6. Push to remote
echo "Pushing to origin/$BRANCH..."
git push origin "$BRANCH"

echo "--- Done! ---"
