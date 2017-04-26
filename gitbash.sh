#!/bin/env bash
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
  eval "git init"
  if [README == 0]; then
    eval "touch README.md"
  fi
  eval "git add ."
  eval "git commit -m "${FIRST_COMMIT_MSG}
  eval "git remote add origin"
  eval "git push -u origin master"
}

#Update an existing repo
#Pass the URL as an argument
function updateRepo {

}

#Notice the 's' right after the word 'Repo'
function createRepos {
  NUM_OF_REPEATS = $# #How many repositories do you want to create?
  for i in 1..NUM_OF_REPEATS; do
    repoName=${$i}
    createRepo repoName
  done
}

function main {
}

#start
main
