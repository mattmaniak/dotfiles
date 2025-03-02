#!/bin/zsh -e

kernel_name=$(uname -s)

source "$HOME/.zshrc"
omz update

case $kernel_name in
    "Darwin")
        # Brew is not recommended on anything but macOS.
        brew update     # Update local repository from a remote.
        brew bundle     # Install and update existing packages from Brewfile.
        brew autoremove # Remove unused dependencies.
        brew cleanup    # Clear cache.

        gem update
        pipx upgrade-all

        mas upgrade
        softwareupdate -l
    ;;
esac
