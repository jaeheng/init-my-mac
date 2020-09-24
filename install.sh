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

# modify hosts
sudo sh -c 'echo "151.101.76.133 raw.githubusercontent.com" >> /etc/hosts'

# install homebrew
HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jaeheng/init-my-mac/master/brew.sh)"/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null

git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git "$(brew --repo homebrew/cask)" --depth=1
git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git "$(brew --repo homebrew/cask-fonts)" --depth=1
git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git "$(brew --repo homebrew/cask-drivers)" --depth=1
git clone https://mirrors.nwafu.edu.cn/homebrew-cask-versions.git "$(brew --repo homebrew/cask-versions)" --depth=1

# brew 程序本身，Homebrew/Linuxbrew 相同
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

# 以下针对 mac OS 系统上的 Homebrew
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
git -C "$(brew --repo homebrew/cask-versions)" remote set-url origin https://mirrors.nwafu.edu.cn/homebrew-cask-versions.git

# 更换后测试工作是否正常
brew update

# install git
brew install git

# install tldr
brew install tldr

# install wget
brew install wget

# install switchhosts
brew cask install switchhosts

# install axel
brew install axel

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# install node v12.18.4
nvm install v12.18.4 --latest-npm

# install nrm
npm install -g nrm

# Use taobao metrics-registry
nrm use taobao

# Install some useful cli tools
npm install -g @vue/cli
npm install -g gulp
npm install -g http-server
npm install -g typescript

# set git config
git config --global user.email $email
git config --global user.name $name

# install vscode
brew cask install visual-studio-code

# install wechat
brew cask install wechat

# install netease music
brew cask install neteasemusic

# install QQ
brew cask install qq

# install chrome
brew cask install google-chrome

# install V2rayU
brew cask install V2rayU

# install thunder
brew cask install thunder

# install iTerm2
brew cask install iTerm2

# install Alfred
brew cask install Alfred

# install The Unarchiver
brew cask install the-unarchiver

# install mysqlworkbench
brew cask install mysqlworkbench

# install Tencent-Lemon
brew cask install Tencent-Lemon

# install qqplayer
brew cask install qqplayer

# install OneDrive
brew cask install OneDrive

# install IINA
brew cask install IINA

# install xunlei player
brew cask ininstallfo xlplayer

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exit

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Done!
echo "Success, enjoy your fe life!"

zsh
