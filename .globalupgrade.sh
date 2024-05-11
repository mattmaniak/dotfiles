#! /bin/zsh -ex

source "$HOME/.zshrc"
omz update

brew update     # Update local repository from a remote.
brew bundle     # Install and update existing packages from Brewfile.
brew autoremove # Remove unused dependencies.
brew cleanup    # Clear cache.

npm update -g

mas upgrade
softwareupdate -l
