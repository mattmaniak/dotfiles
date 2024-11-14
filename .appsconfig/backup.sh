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
    cp "$vscode_user_settings_file" ".code_$target_vscode_settings_file"
    ls -al ".code_$target_vscode_settings_file"
else
    echo "Unable to backup VS Code $target_vscode_settings_file from $vscode_user_settings_file due to the lack of source directory."
    exit 1
fi

