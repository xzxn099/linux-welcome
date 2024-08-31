#!/bin/bash

# Check if figlet is installed
if ! command -v figlet &> /dev/null; then
    echo "figlet is not installed. Installing..."

    # Install figlet using apt
    sudo apt-get update 
    sudo apt-get install -y figlet

    echo "figlet installed successfully."
else
    echo "figlet is already installed."
fi

source_script_path="$(dirname "$0")/dateart.sh"
target_script_path="/usr/local/bin/dateart.sh"

if [ ! -f "$source_script_path" ]; then
    echo "Error: Script not found. Please check the path."
    exit 1
fi

# Set permissions before copying
chmod 755 "$source_script_path"

# Copy the script to the target location
sudo cp "$source_script_path" "$target_script_path"

# Detect the current shell
current_shell=$(basename "$SHELL")

# Add the script execution to the appropriate shell configuration file
case "$current_shell" in
    bash)
        echo "$target_script_path" >> ~/.bashrc
        ;;
    zsh)
        echo "$target_script_path" >> ~/.zshrc
        ;;
    *)
        echo "Unsupported shell: $current_shell"
        exit 1
        ;;
esac

echo "Setup complete. The date script will run on new terminal sessions."
