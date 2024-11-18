#! /bin/zsh -e

# https://stackoverflow.com/a/379842
for i in `git branch -a | grep remote | grep -v HEAD | grep -v master`; do git branch --track ${i#remotes/origin/} $i; done
