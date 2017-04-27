#!/bin/env bash

USERNAME=$(git config user.name)
GIT_PROFILE="https://github.com/"$USERNAME"/"
#Set to 1 if you want a README.md file to created when you make a new git repo
#Set to 0 if you don't want a README.md file
README=0
FIRST_COMMIT_MSG="\"Initial commit\""
DATE=$(date +%Y-%m-%d)

function create {
  for repo in "$@"; do
    mkdir $repo
    cd $repo
    curl -u $USERNAME https://api.github.com/user/repos -d "{\"name\":\"$repo\"}"
    git init
    if [README -eq 0]; then
      touch README.md
    fi
    git add .
    git commit -m ${FIRST_COMMIT_MSG}
    git remote add origin "$GIT_PROFILE""$repo"".git"
    git push -u origin master
    cd ..
    echo "Creating $repo complete"
  done
}

#loops through a list of repos and then pushes them into github
function push {
  for repo in "$@"; do
    cd $repo
    git add .
    git commit -m "$DATE" #the commit message will be the current date
    git remote add origin "$GIT_PROFILE""$repo"".git"
    git push -u origin master
    cd ..
    echo "Repository $repo updated"
  done
}
