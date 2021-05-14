#!/bin/bash

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

echo ""
echo "${BLUE}Running this script will do the following to your shell: "
echo "  - Download zsh-completions"
echo "  - Download powerlevel9k theme"
echo "  - Download zsh-autosuggestions"
echo "  - Download zsh-syntax-highlighting"
echo "  - Modify the ~/.zshrc: to include these libraries and themes, nvm, and environment aliases."
printf "Press [y/Y] to continue or ${RED}CTRL+C to cancel${BLUE}: ${NC} "
read -k userResponse
echo "\n"

case $userResponse in
[yY])
	if [[ $os != "mac" ]]; then
		zshSetup
		# Modify the ~/.zshrc
		echo "${GREEN}Modifying ~/.zshrc....${NC}"
		sed -i 's/robbyrussell/powerlevel9k\/powerlevel9k/g' ~/.zshrc &&
			sed -i 's/plugins=(git)/plugins=(git virtualenv zsh-autosuggestions zsh-completions zsh-syntax-highlighting)/g' ~/.zshrc &&
			echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)' >>~/.zshrc &&
			echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv root_indicator background_jobs history time)' >>~/.zshrc &&
			echo 'POWERLEVEL9K_PROMPT_ON_NEWLINE=true' >>~/.zshrc &&
			echo 'POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"' >>~/.zshrc &&
			echo 'local user_symbol="$"
    if [[ $(print -P "%#") =~ "#" ]]; then
        user_symbol = "#"
    fi
    ' >>~/.zshrc &&
			echo 'POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"' >>~/.zshrc &&
			echo 'POWERLEVEL9K_PROMPT_ADD_NEWLINE=true' >>~/.zshrc &&
			echo 'POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="red"' >>~/.zshrc &&
			echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >>~/.zshrc &&
			echo 'alias aks="kubectl config use-context $(basename $PWD)aks"' >>~/.zshrc &&
			echo 'alias dev="kubectl config use-context $(basename $PWD) && source api-v2/.venv/bin/activate"' >>~/.zshrc &&
			echo 'alias ska="dev && skaffold dev --port-forward -n dev"' >>~/.zshrc
		echo "${GREEN}Done.${NC}"
		echo ""
		echo "${GREEN}This script is done running."
		echo "Make sure to restart your terminal, run 'nvm install 14', 'az login', and 'az aks get-credentials ...'.${NC}"
		echo ""
	else
		zshSetup
		# Modify the ~/.zshrc
		echo "${GREEN}Modifying ~/.zshrc....${NC}"
		sed -i '' 's/robbyrussell/powerlevel9k\/powerlevel9k/g' ~/.zshrc &&
			sed -i '' 's/plugins=(git)/plugins=(git virtualenv zsh-autosuggestions zsh-completions zsh-syntax-highlighting)/g' ~/.zshrc &&
			echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)' >>~/.zshrc &&
			echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv root_indicator background_jobs history time)' >>~/.zshrc &&
			echo 'POWERLEVEL9K_PROMPT_ON_NEWLINE=true' >>~/.zshrc &&
			echo 'POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"' >>~/.zshrc &&
			echo 'local user_symbol="$"
    if [[ $(print -P "%#") =~ "#" ]]; then
        user_symbol = "#"
    fi
    ' >>~/.zshrc &&
			echo 'POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"' >>~/.zshrc &&
			echo 'POWERLEVEL9K_PROMPT_ADD_NEWLINE=true' >>~/.zshrc &&
			echo 'POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="red"' >>~/.zshrc &&
			echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >>~/.zshrc &&
			echo 'alias aks="kubectl config use-context $(basename $PWD)aks"' >>~/.zshrc &&
			echo 'alias dev="kubectl config use-context $(basename $PWD) && source api-v2/.venv/bin/activate"' >>~/.zshrc &&
			echo 'alias ska="dev && skaffold dev --port-forward -n dev"' >>~/.zshrc
		echo "${GREEN}Done.${NC}"
		echo ""
		echo "${GREEN}This script is done running."
		echo "Make sure to run 'nvm install 14', 'az login', and 'az aks get-credentials ...'.${NC}"
	fi
	;;
*)
	echo "${RED}This is not a valid option.${NC}"
	;;
esac

zshSetup() {
	# Clone zsh-completions
	echo "${GREEN}Cloning zsh completions...${NC}"
	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
	echo "${GREEN}Done.${NC}"
	echo ""

	# Clone powerlevel9k theme
	echo "${GREEN}Clone powerlevel9k theme...${NC}"
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	echo "${GREEN}Done.${NC}"
	echo ""

	# Clone zsh-autosuggestions
	echo "${GREEN}Clone zsh-autosuggestions...${NC}"
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	echo "${GREEN}Done.${NC}"
	echo ""

	# Clone zsh-autosuggestions
	echo "${GREEN}Clone zsh-syntax-highlighting...${NC}"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "${GREEN}Done.${NC}"
	echo ""

}
