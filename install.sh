# Install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install iterm2
brew install iterm2 --cask

# Install zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/Work

# Install SourceTree
brew install sourcetree --cask

# Install wget
brew install wget

# Install maven
brew install maven

# Install nodejs
brew install nvm 
mkdir ~/.nvm
echo "export NVM_DIR=~/.nvm" >> ~/.zshrc
cat << EOT >> ~/.zshrc
# NVM Constants
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
EOT
nvm install 16.14.0 # Choose latest version supported by Appsmith here
nvm use 16.14.0

# Install yarn
brew install yarn

# Install java
brew install openjdk@17
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include" >> ~/.zshrc

# Install Docker


# Install VSCode
brew install visual-studio-code --cask

# Install python3
brew install python3

# Generate ssh keys
if [ ! -f ~/.ssh/id_rsa ]; 
	then ssh-keygen -t rsa ; 
fi

# Install Postman
brew install postman --cask

# Install Studio 3T
brew install studio-3t --cask

# Installing redis-cli. The assumption is that the actual redis service will be run via Docker
brew tap ringohub/redis-cli
brew update && brew doctor
brew install redis-cli

# Pull the required database services that are commonly used. Can comment this if not required.
docker pull mongo
docker pull redis

# Appsmith repo pre-requisites
brew install git-secrets
git secrets --register-aws

# Client code pre-requisites
brew install mkcert
brew install nss
brew install gettext

npm install -g yarn

brew tap mongodb/brew
brew update
brew install mongodb-community@6.0
