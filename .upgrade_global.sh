#! /bin/zsh -ex

brew update && brew upgrade
npm update -g

mas upgrade
softwareupdate -l
