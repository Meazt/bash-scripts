#!/bin/env bash
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE
#THIS IS INCOMPLETE

#Run this script in the directory
#Set Github username and password
#e.g.
#USERNAME="example"
#PASSWORD="example12345"

USERNAME=
PASSWORD=

#Set to 1 if you want a README.md file to created when you make a new git repo
#Set to 0 if you don't want a README.md file
README=0
FIRST_COMMIT_MSG="\"First commit\""

function createRepo {
  repoName=$1
  curl -u $USERNAME https://api.github.com/user/repos -d "{\"name\":\"$repoName\"}"
  git init
  if [README == 0]; then
    touch README.md
  fi
  git add .
  git commit -m ${FIRST_COMMIT_MSG}
  git remote add origin "https://github.com/"$USERNAME"/"$repoName".git"
  git push -u origin master
}

#Notice the 's' right after the word 'Repo'
function createRepos {
  NUM_OF_REPEATS = $# #How many repositories do you want to create?
  for i in 1..NUM_OF_REPEATS; do
    repoName=${$i}
    createRepo repoName
  done
}
