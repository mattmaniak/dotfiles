#!/bin/zsh -e

kernel_name=$(uname -s)
mode="$1"

vscode_target_settings_file="settings.json"
vscode_backuped_settings_file=".vscode_$vscode_target_settings_file"
vscode_relative_config_path="Code/User"

case $kernel_name in
    "Darwin")
        vscode_user_settings_file="$HOME/Library/Application Support/$vscode_relative_config_path/$vscode_target_settings_file"
    ;;
    "Linux")
        vscode_user_settings_file="$HOME/.config/$vscode_relative_config_path/$vscode_target_settings_file"
    ;;
esac

case "$mode" in
    "backup")
        if [ -d "$vscode_user_settings_file" ]; then
            cp "$vscode_user_settings_file" "$vscode_backuped_settings_file"
            ls -al "$vscode_backuped_settings_file"
        else
            echo "Unable to backup VS Code $vscode_target_settings_file from $vscode_user_settings_file due to the lack of source directory."
            exit 1
        fi
    ;;
    "install")
        # Install
        if [ -d "$vscode_user_settings_file" ]; then
            cp "$vscode_backuped_settings_file" "$vscode_user_settings_file"
            ls -l "$vscode_user_settings_file"
        else
            echo "Unable to install VS Code $vscode_target_settings_file to $vscode_user_settings_file due to the lack of target directory."
            exit 1
        fi

    ;;
    *)
        echo "Wrong script parameter or lack of it. Use: \"backup\" or \"install\" for a corresponding actions."
        exit 1
    ;;
esac
