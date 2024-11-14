#! /bin/zsh -e

kernel_name=$(uname -s)
target_vscode_settings_file="settings.json"

case $kernel_name in
    "Darwin")
        vscode_user_settings_file="$HOME/Library/Application Support/Code/User/$target_vscode_settings_file"
    ;;
    "Linux")
        vscode_user_settings_file="$HOME/.config/Code/User/$target_vscode_settings_file"
    ;;
esac

cp "$vscode_user_settings_file" ".code_$target_vscode_settings_file"
ls -al ".code_$target_vscode_settings_file"
