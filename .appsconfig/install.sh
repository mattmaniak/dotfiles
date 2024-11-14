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

if [ -d "$vscode_user_settings_file" ]; then
    cp ".code_$target_vscode_settings_file" "$vscode_user_settings_file"
    ls -l "$vscode_user_settings_file"
else
    echo "Unable to install VS Code $target_vscode_settings_file to $vscode_user_settings_file due to the lack of target directory."
    exit 1
fi
