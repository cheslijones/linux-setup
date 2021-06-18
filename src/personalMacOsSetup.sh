#!/bin/zsh

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/cheslijones/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install rosetta
sudo softwareupdate --install-rosetta

# Install Microsoft Teams
brew install --cask microsoft-teams

# Install Zoho Mail
brew install --cask zoho-mail

# Install Unity Hub
brew install --cask unity-hub

# Install rectangle
brew install --cask rectangle

# Install iterm2
brew install --cask iterm2

# Install postman
brew install --cask postman

# Install pgadmin4
brew install --cask pgadmin4

# Install VS Codium
brew install --cask vscodium

# Install Azure CLI
brew install azure-cli

# Install Virtualenv
sudo pip3 install virtualenv

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Install docker
brew install --cask docker

# Install Kubectl
brew install kubectl

# Install minikube
brew install minikube

# Install skaffold
brew install skaffold

# Install helm
brew install helm

# Install PostgreSQL
brew install postgresql

# Make project directories
mkdir ~/Projects
mkdir {~/Projects/Music,~/Projects/Games,~/Projects/Apps,~/Projects/Classes}
mkdir {~/Projects/Apps/Croner,~/Projects/Apps/Personal} 

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"