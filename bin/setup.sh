#!/bin/bash
#
# Install dependencies.
set -e

SETUP_INIT="${HOME}/.setup_init"

if [ -f "${SETUP_INIT}" ]; then exit 0; fi

echo "==> Installing dependencies..."

if [ ! `which brew` ]; then
echo "==>   Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update --force && brew upgrade
fi

if [ ! `which pip` ]; then
echo "==>   Installing pip..."
brew install pyenv
pyenv install anaconda3-4.0.0
pyenv global anaconda3-4.0.0
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
sudo pip install -r requirements.txt
fi

if [ ! `which ansible` ]; then
echo "==>   Installing ansible..."
brew install ansible
fi

touch $SETUP_INIT
