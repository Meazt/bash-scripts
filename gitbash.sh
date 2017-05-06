#!/bin/env bash

#Use this bash script whenever you want to automate pushing multiple repositories to Github
#Create multiple repositories
#Or delete multiple repositories
#I may add some more features to this script so that it becomes more versatile
{
  USERNAME=$(git config user.name)
  PASSWORD= #set PASSWORD to your password
  GIT_PROFILE="https://github.com/"$USERNAME"/"
  #if README is 0 then create() will create a README.md file
  #else create() won't create a README.md file
  README=0
  FIRST_COMMIT_MSG="\"Initial commit\""
  DATE=$(date +%Y-%m-%d)

  echo "USERNAME: "$USERNAME
  echo "PROFILE: "$GIT_PROFILE

  function create {
    for repo in "$@"; do
      echo "MAKING $repo REPOSITORY"
      mkdir $repo
      cd ./$repo
      curl -u $USERNAME:$PASSWORD https://api.github.com/user/repos -d "{\"name\":\"$repo\"}"
      git init
      if [[ $README -eq 0 ]]; then
        touch README.md
      fi
      eval "git add ."
      git commit -m "\"$FIRST_COMMIT_MSG\""
      git remote add origin $GIT_PROFILE$repo.git
      git push -u origin master
      cd ..
      echo "CREATING $repo REPOSITORY COMPLETE"
    done
  }

  #loops through a list of repos and then pushes them into github
  function push {
    for repo in "$@"; do
      echo "PUSHING TO $repo REPOSITORY"
      cd $repo
      eval "git add ."
      git commit -m "\"$DATE\"" #the commit message will be the current date
      git remote add origin $GIT_PROFILE$repo.git
      git push -u origin master
      cd ..
      echo "$repo REPOSITORY PUSH COMPLETE"
    done
  }

  function delete {
    echo "delete"
  }

  function main {
    git_function=$1
    shift #removes the first argument which is the git function to use from the args list
    args=$@
    $git_function $args
    git reset
  }

  main $@
}
