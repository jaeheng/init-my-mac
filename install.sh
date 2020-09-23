#!/bin/bash
set -u

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install git
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install v12.18.4 --latest-npm
npm install -g nrm
nrm use taobao
npm install -g @vue/cli
npm install -g gulp
npm instlal -g http-server
npm install -g typescript

echo "Success, enjoy your fe life!"