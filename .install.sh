#! /bin/zsh -e

vscode_user_settings_file="$HOME/Library/Application Support/Code/User/settings.json"

cp ".code_settings.json" "$vscode_user_settings_file"
ls -l "$vscode_user_settings_file"
