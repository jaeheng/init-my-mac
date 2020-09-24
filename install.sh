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
HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jaeheng/init-my-mac/master/brew.sh)"

git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask --depth=1
git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-fonts --depth=1
git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-drivers --depth=1

# brew 程序本身，Homebrew/Linuxbrew 相同
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

# 以下针对 mac OS 系统上的 Homebrew
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

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
wget https://vscode.cdn.azure.cn/stable/58bb7b2331731bf72587010e943852e13e6fd3cf/VSCode-darwin-stable.zip
unzip VSCode-darwin-stable.zip
mv Visual\ Studio\ Code.app /Applications/
rm -f VSCode-darwin-stable.zip

# install wechat
wget https://dldir1.qq.com/weixin/mac/WeChatMac.dmg
hdiutil attach WeChatMac.dmg
cp -rf /Volumes/微信\ WeChat/WeChat.app /Applications/
rm -f ./WeChatMac.dmg
hdiutil eject /Volumes/微信\ WeChat/

# install netease music
wget -O NeteaseMusic.dmg http://d1.music.126.net/dmusic/NeteaseMusic_2.3.2_832_web.dmg
hdiutil attach NeteaseMusic.dmg
cp -rf /Volumes/网易云音乐/NeteaseMusic.app /Applications/
rm -f NeteaseMusic.dmg
hdiutil eject /Volumes/网易云音乐/

# install QQ
wget -O QQ.dmg https://dldir1.qq.com/qqfile/QQforMac/QQ_6.6.9.dmg
yes qy | hdiutil attach QQ.dmg > /dev/null
cp -rf /Volumes/QQ/QQ.app /Applications
rm -f QQ.dmg
hdiutil eject /Volumes/QQ

# install chrome
wget -O googlechrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil attach googlechrome.dmg -nobrowse
cp -rf /Volumes/Google\ Chrome/Google\ Chrome.app /Applications
rm -f googlechrome.dmg
hdiutil eject /Volumes/Google\ Chrome

# install V2rayU
wget https://github.com/yanue/V2rayU/releases/download/2.3.1/V2rayU.dmg
hdiutil attach V2rayU.dmg -nobrowse
cp -rf /Volumes/V2rayU\ Installer/V2rayU.app /Applications
rm -f V2rayU.dmg
hdiutil eject /Volumes/V2rayU\ Installer

# install thunder
wget -O thunder.dmg http://down.sandai.net/mac/thunder_3.4.1.4368.dmg
hdiutil attach thunder.dmg -nobrowse
cp -rf /Volumes/迅雷/Thunder.app /Applications
rm -f thunder.dmg
hdiutil eject /Volumes/迅雷/

# install iTerm2
wget -O iTerm2.zip https://raw.githubusercontent.com/jaeheng/init-my-mac/master/application/iTerm2-3_3_12.zip
unzip iTerm2.zip
mv iTerm.app /Applications/
rm -f iTerm2.zip

# install Alfred
wget -O alfred.dmg https://cachefly.alfredapp.com/Alfred_4.1.1_1172.dmg
hdiutil attach alfred.dmg -nobrowse
cp -rf /Volumes/Alfred/Alfred\ 4.app /Applications
rm -f alfred.dmg
hdiutil eject /Volumes/Alfred/

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
