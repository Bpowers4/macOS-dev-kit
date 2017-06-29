#!/bin/bash

# DESCRIPTION
# Installs OSX applications.

printf "Checking for Homebrew... "
if ! command -v brew > /dev/null; then
	echo "WARNING: Homebrew is not installed. First install Homebrew and its binaries to install all the apps."
else
	echo "Homebrew instaled."
fi

apps=(
	# work
    sublime-text
	virtualbox
	mactex
	macvim
	vagrant
	intellij-idea
	pycharm
	clion
    gns3
	docker
	docker-toolbox
    meld

	# productivity, core, runtimes
	appcleaner
	osxfuse
	java
	switchresx
	flux
    spectacle
	the-unarchiver
    xquartz

	# sharing
	dropbox
    google-drive

	# browsers
	google-chrome
	firefox

	# communication
	franz
    skype
    slack

 	# entertainment
	spotify
	mplayerx

	# file sharing
	transmission
)

names=(
	'Sublime Text 3'
	'VirtualBox'
	'MacTeX'
	'MacVim'
	'Vagrant'
	'IntelliJ IDEA - Professional Version'
	'PyCharm - Professional Version'
	'CLion - Professional Version'
    'GNS3'
	'Docker'
	'Docker Toolbox'
    'Meld'
	'AppCleaner'
	'OSXFuse'
	'JavaSDK'
	'SwitchResX - Paid Version'
	'flux'
	'Spectacle'
	'The Unarchiever'
    'XQuartz'
	'Dropbox'
    'Google-Drive'
	'Google Chrome'
	'Mozilla Firefox'
	'Franz'
    'Skype'
    'Slack'
	'Spotify'
	'MPlayerX'
	'Transmission'
)

if [[ $# == 0 ]]; then
	echo "Installing apps to /Applications..."

	for ((i=0; i < ${#apps[@]}; i++))
	do
		printf "Do you want to install ${names[$i]}? (y/n)  "
		read -r response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
			brew cask install --appdir="/Applications" ${apps[$i]}
		fi
	done
else
	echo "Installing all apps to /Applications..."
	brew cask install --appdir="/Applications" ${apps[@]}
fi

echo "Cleaning Homebrew Cask chache..."
brew cask cleanup
echo "Selected applications instaled!"
