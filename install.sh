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

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install git
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install v12.18.4 --latest-npm
npm install -g nrm
nrm use taobao
npm install -g @vue/cli
npm install -g gulp
npm install -g http-server
npm install -g typescript

git config --global user.email $email
git config --global user.name $name

echo "Success, enjoy your fe life!"