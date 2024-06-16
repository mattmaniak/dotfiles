#! /bin/zsh -e

source "$HOME/.zshrc"
omz update

brew update     # Update local repository from a remote.
brew bundle     # Install and update existing packages from Brewfile.
brew autoremove # Remove unused dependencies.
brew cleanup    # Clear cache.

mas upgrade
softwareupdate -l
