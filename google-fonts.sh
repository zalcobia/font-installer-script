#!/usr/bin/env bash

# Written by: Pedro Graça
# Based on AUR package <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-google-fonts-git>

# before executing file do "sudo -s"

# dependancies: fonts-cantarell, ttf-ubuntu-font-family, ttf-mscorefonts-installer, git
apt install fonts-cantarell ttf-ubuntu-font-family ttf-mscorefonts-installer git
srcdir="/tmp/google-fonts"
pkgdir="/usr/share/fonts/truetype/google-fonts"
giturl="git://github.com/google/fonts.git"
giturl="git://github.com/adobe-fonts/source-code-pro.git"
giturl="git://github.com/source-foundry/Hack.git"
giturl="git://github.com/googlefonts/roboto.git"

mkdir $srcdir
cd $srcdir
echo "Cloning Git repository..."
git clone $giturl

echo "Installing fonts..."
mkdir -p $pkgdir
find $srcdir -type f -name "*.ttf" -exec install -Dm644 {} $pkgdir \;

echo "Cleaning up..."
find $pkgdir -type f -name "Cantarell-*.ttf" -delete \;
find $pkgdir -type f -name "Ubuntu-*.ttf" -delete \;

echo "Updating font-cache..."
fc-cache -f > /dev/null

echo "Done!"
