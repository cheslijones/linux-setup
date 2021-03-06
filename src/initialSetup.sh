#!/bin/zsh

# determine the OS, distro and shell
if grep -q icrosoft /proc/version; then
	os="wsl"
elif [[ $(uname) = "Darwin" ]]; then
	os="mac"
else
	os="linux"
fi

# formats
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m"
PROMPT_EOL_MARK=""

if [[ $os != "mac" ]]; then
	echo ""
	echo "${BLUE}Running this script will do the following to your shell: "
	echo "  - Update and upgrade OS dependencies"
	echo "  - Install Azure CLI"
	echo "  - Install pip and virtualenv"
	echo "  - Install zsh"
	echo "  - Install nvm"
	echo "  - Install Docker"
	echo "  - Install Kubernetes"
	echo "  - Install Minikube"
	echo "  - Install Skaffold"
	echo "  - Install Helm"
	echo "  - Install Oh My Zsh"
	echo "You will need to run the zshSetup.sh script after this script runs to finish setup."
	printf "Press [y/Y] to continue or ${RED}CTRL+C to cancel${BLUE}: ${NC} "
	read -k userResponse
	echo "\n"
	case $userResponse in
	[yY])
		linuxSetup
		echo "${GREEN}This script is done running.${NC}"
		echo "${GREEN}Run zshSetup.sh to continue setup.${NC}"
		echo ""
		;;
	*)
		echo "${RED}This is not a valid option.${NC}"
		;;
	esac
else
	echo ""
	echo "${BLUE}Running this script will do the following to your shell: "
	echo "  - Install Homebrew"
	echo "  - Install iTerm2"
	echo "  - Install Postman"
	echo "  - Install pgAdmin4"
	echo "  - Install VS Code"
	echo "  - Install Azure Storage Explorer"
	echo "  - Install Azure CLI"
	echo "  - Install virtualenv"
	echo "  - Install nvm"
	echo "  - Install Docker"
	echo "  - Install Kubernetes"
	echo "  - Install Minikube"
	echo "  - Install Skaffold"
	echo "  - Install Helm"
	echo "  - Install PostgreSQL"
	echo "  - Install Oh My Zsh"
	echo "You will need to run the zshSetup.sh script after this script runs to finish setup."
	printf "Press [y/Y] to continue or ${RED}CTRL+C to cancel${BLUE}: ${NC} "
	read -k userResponse
	echo "\n"
	case $userResponse in
	[yY])
		macSetup
		echo "${GREEN}This script is done running.${NC}"
		echo "${GREEN}Run zshSetup.sh to continue setup.${NC}"
		echo ""
		;;
	*)
		echo "${RED}This is not a valid option.${NC}"
		;;
	esac
fi

macSetup() {
	# Installing homebrew
	echo "${GREEN}Installing homebrew...${NC}"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/cheslijones/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install iTerm2
	echo "${GREEN}Installing iTerm2...${NC}"
	brew install --cask iterm2
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Postman
	echo "${GREEN}Installing Postman...${NC}"
	brew install --cask postman
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install pgAdmin
	echo "${GREEN}Installing pgAdmin...${NC}"
	brew install --cask pgadmin4
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install VS Code
	echo "${GREEN}Installing VS Code...${NC}"
	brew install --cask visual-studio-code
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Azure Storage Explorer
	echo "${GREEN}Installing Azure Storage Explorer...${NC}"
	brew install --cask microsoft-azure-storage-explorer
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install az cli
	echo "${GREEN}Installing Azure CLI...${NC}"
	brew install azure-cli
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install virtualenv
	echo "${GREEN}Installing virtualenv...${NC}"
	sudo pip3 install virtualenv
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install nvm
	echo "${GREEN}Installing nvm...${NC}"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install docker
	echo "${GREEN}Installing docker...${NC}"
	brew install --cask docker
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install docker
	echo "${GREEN}Installing kubectl...${NC}"
	brew install kubectl
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Minikube
	echo "${GREEN}Installing minikube...${NC}"
	brew install minikube
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Skaffold
	echo "${GREEN}Installing skaffold...${NC}"
	brew install skaffold
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Helm
	echo "${GREEN}Installing helm...${NC}"
	brew install helm
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install postgres
	echo "${GREEN}Installing PostgreSQL...${NC}"
	brew install postgresql
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install oh-my-zsh
	echo "${GREEN}Installing Oh My Zsh...${NC}"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo "${GREEN}Done.${NC}"
	echo ""

}

linuxSetup() {
	# Make sure in user's root directory
	echo "${GREEN}Changing to user's root directory...${NC}"
	cd ~/
	echo "${GREEN}Done.${NC}"
	echo ""

	# Update OS repos
	echo "${GREEN}Updating operating system repos...${NC}"
	sudo apt update
	echo "${GREEN}Done.${NC}"
	echo ""

	# Upgrade OS dependencies
	echo "${GREEN}Upgrading operating system dependencies...${NC}"
	sudo apt upgrade -y
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install az cli
	echo "${GREEN}Installing Azure CLI...${NC}"
	curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install pip3
	echo "${GREEN}Installing pip3...${NC}"
	sudo apt install python3-pip -y
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install virtualenv
	echo "${GREEN}Installing virtualenv...${NC}"
	sudo apt install python3-virtualenv -y
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install zsh
	echo "${GREEN}Installing zsh...${NC}"
	sudo apt install zsh -y
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install nvm
	echo "${GREEN}Installing nvm...${NC}"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install docker
	echo "${GREEN}Installing Docker...${NC}"
	sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common -y &&
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
		sudo apt-key fingerprint 0EBFCD88 &&
		sudo add-apt-repository \
			"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable" &&
		sudo apt-get update &&
		sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
		sudo usermod -aG docker $USER
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Kubernetes
	echo "${GREEN}Installing Kubernetes...${NC}"
	sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl &&
		sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&
		echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list &&
		sudo apt-get update &&
		sudo apt-get install -y kubectl &&
		rm -rf kube*
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Minikube
	echo "${GREEN}Installing minikube...${NC}"
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb &&
		sudo dpkg -i minikube_latest_amd64.deb &&
		rm -rf minikube*
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Skaffold
	echo "${GREEN}Installing skaffold...${NC}"
	curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 &&
		sudo install skaffold /usr/local/bin/ &&
		rm -rf skaffold*
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install Helm
	echo "${GREEN}Installing helm...${NC}"
	curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - &&
		sudo apt-get install apt-transport-https --yes &&
		echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list &&
		sudo apt-get update &&
		sudo apt-get install helm
	echo "${GREEN}Done.${NC}"
	echo ""

	# Install oh-my-zsh`
	echo "${GREEN}Installing Oh My Zsh...${NC}"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo "${GREEN}Done.${NC}"
	echo ""
}
