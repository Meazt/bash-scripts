#!/bin/env bash

#script used to install atom themes and packages that I have.
#in case if I ever get a new computer and can't remember what
#packages or themes I installed for atom.
#or if I have a lot of themes and packages installed and I don't want to
#install each one of them one by one.

function install_themes {
  apm install atom-material-ui
  apm install atom-material-syntax
  apm install nebula-ui
  apm install nebula-syntax
}

function install_packages {
  apm install git-plus
}

if [ -x /usr/bin/apm ]; then
  echo "installing apm themes"
  install_themes
  echo "installing packages"
  install_packages
else
  echo "apm not installed"
  echo "installing apm"
  os="uname"
  if [[ $os == "Darwin" ]]; then
    echo "do stuff"
  elif [[ $os == "Linux" ]]; then
    echo "do stuff"
  fi
fi
