#!/bin/bash

if [[ $(command -v 7z) ]]; then
  echo "Testing 7z is installed or not, 7z Found Successfully"
else
  sudo dnf install p7zip-plugins
fi

if [[ $(command -v curl) ]]; then
  echo "Testing curl is installed or not, curl found Successfully"
else
  sudo dnf install curl
fi
curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg

7z x SF-Mono.dmg

cd SFMonoFonts

7z x SF\ Mono\ Fonts.pkg

7z x Payload\~

if [[ -d "$HOME/.fonts/" ]]; then
  true
else
  mkdir ~/.fonts/
fi
#mkdir ~/.fonts

cp Library/Fonts/* ~/.fonts
