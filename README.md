# Overview

I frequently find myself trying out new Debian-based Linux distributions and WSL2 features. Manually setting up my environment was getting pretty old, so I wrote these scripts.

Please see below for a summary of what is going on in each scripts. Obviously, this setup won't be for everyone, but it suits my use case, so make sure to read the below before running.

So far it only works for Debian-based Linux distributions and WSL2. I need to expand it to macOS and other Linux distributions. Windows Command Prompt and PowerShell would need entirely separate scripts since they cannot run `.sh`.

# Scripts

## `initialSetup.sh`

Running this script will do the following to your shell: 
  - Update and upgrade OS dependencies
  - Install Azure CLI
  - Install pip and virtualenv
  - Install zsh
  - Install nvm
  - Install Docker
  - Install Kubernetes
  - Install Minikube
  - Install Skaffold
  - Install Helm
  - Install Oh My Zsh

## `zshSetup.sh`
Running this script will do the following to your shell: 
  - Download zsh-completions
  - Download powerlevel9k theme
  - Download zsh-autosuggestions
  - Download zsh-syntax-highlighting
  - Modify the ~/.zshrc to include these libraries and themes, nvm, and environment aliases.

## Post-scripts
You will need to restart your terminal, run `nvm install 14`, `az login`, and `az aks get-credentials ...`.