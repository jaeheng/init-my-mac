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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install git
brew install git

# install tldr
brew install tldr

# install wget
brew install wget

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
wget -O iTerm2.zip https://iterm2.com/downloads/stable/iTerm2-3_3_12.zip
unzip iTerm2.zip
mv iTerm.app /Applications/
rm -f iTerm2.zip

# install Alfred
wget -O alfred.dmg https://cachefly.alfredapp.com/Alfred_4.1.1_1172.dmg
hdiutil attach alfred.dmg -nobrowse
cp -rf /Volumes/Alfred/Alfred\ 4.app /Applications
rm -f alfred.dmg
hdiutil eject /Volumes/Alfred/

# install switchhosts
brew cask install switchhosts

# Done!
echo "Success, enjoy your fe life!"
