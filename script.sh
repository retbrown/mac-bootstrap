#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#one install complete check command works
brew commands
if [ $? -eq 0 ]; then
    echo "Brew OK"
else
    exit 1
fi
#install line homebrew packages
BREW_PACKAGES=$(curl -fsSL https://raw.githubusercontent.com/retbrown/mac-bootstrap/master/homebrew)

echo "$BREW_PACKAGES"

brew install $BREW_PACKAGES

brew tap homebrew/cask-versions

#install cask packages
CASK_PACKAGES=$(curl -fsSL https://raw.githubusercontent.com/retbrown/mac-bootstrap/master/homebrew-cask)
echo "$CASK_PACKAGES"
brew cask install $BREW_PACKAGES

#copy mackup config
curl -fsSL https://raw.githubusercontent.com/retbrown/mac-bootstrap/master/.mackup.cfg -o ~/.mackup.cfg
#copy shuttle config to get started
curl -fsSL https://raw.githubusercontent.com/retbrown/mac-bootstrap/master/.shuttle.json -o ~/.shuttle.json
