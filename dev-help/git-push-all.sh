#!/bin/bash
MESSAGE=$1

if [ -z "$MESSAGE" ]; then
  echo "Usage: ./commit-all.sh 'Your commit message'"
  exit 1
fi

for d in */ ; do
  if [ -d "$d/.git" ]; then
    echo "➡️ Processing $d"
    cd "$d"
    git pull
    git add .
    git commit -m "$MESSAGE" || echo "⚠️ Nothing to commit in $d"
    git push
    cd ..
  fi
done
