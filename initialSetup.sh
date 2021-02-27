#!/bin/bash
cd ~/ && \
sudo apt update && \
sudo apt upgrade -y && \
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash && \
sudo apt install python3-pip -y && \
sudo apt install python3-virtualenv -y && \
sudo apt install zsh -y && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo apt-key fingerprint 0EBFCD88 && \
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \
sudo apt-get update && \
sudo apt-get install docker-ce docker-ce-cli containerd.io -y && \
sudo usermod -aG docker $USER && \
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl && \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && \
sudo apt-get update && \
sudo apt-get install -y kubectl && \
rm -rf kube* && \
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb && \
sudo dpkg -i minikube_latest_amd64.deb && \
rm -rf minikube* && \
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
sudo install skaffold /usr/local/bin/ && \
rm -rf skaffold* && \
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - && \
sudo apt-get install apt-transport-https --yes && \
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list && \
sudo apt-get update && \
sudo apt-get install helm && \
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
