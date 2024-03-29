#!/bin/bash
set -u

# input git config, user.email and user.name
read -t 10 -p "git user.email: " email
if [ ! $email ]
then
    echo 'Error: empty user.email!'
    exit
fi

read -t 10 -p "git user.name: " name

if [ ! $name ]
then
    echo 'Error: empty user.name!'
    exit
fi

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 更换后测试工作是否正常
brew update

# install tldr
brew install tldr

# install wget
brew install wget

# install axel
brew install axel

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# install node lts
nvm install --lts --latest-npm

# install nrm
npm install -g nrm

# Install some useful cli tools
npm install -g http-server
npm install -g typescript
npm install -g vite

# set git config
git config --global user.email $email
git config --global user.name $name

# install vscode
brew install --cask visual-studio-code

# install wechat
brew install --cask wechat

# install netease music
brew install --cask neteasemusic

# install QQ
brew install --cask qq

# install chrome
brew install --cask google-chrome

# install thunder
brew install --cask thunder

# install iTerm2
brew install --cask iTerm2

# install Alfred
brew install --cask Alfred

# install The Unarchiver
brew install --cask the-unarchiver

# install Tencent-Lemon
brew install --cask Tencent-Lemon

# install OneDrive
brew install --cask OneDrive

# install IINA
brew install --cask IINA

# install xunlei player
brew install --cask xlplayer

# install baidu net disk
brew install --cask baidunetdisk

# install webstorm
brew install --cask webstorm

# install phpstorm
brew install --cask phpstorm

# install pycharm
brew install --cask pycharm

# install php switcher
brew tap shivammathur/php
brew install shivammathur/php/php@7.4
brew install shivammathur/php/php@8.2


# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Done!
echo "Success, enjoy your mac!"

exit
