#!/bin/bash

# Install XCode tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install wget
brew install wget

# Install office
brew cask install microsoft-office
wget -O ~/Downloads/office-serializer.pkg "https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/Microsoft_Office_2019_VL_Serializer.pkg"
open ~/Downloads/office-serializer.pkg

# Install NVM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

# Install Fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# Fix iterm ohmyzsh perms
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions