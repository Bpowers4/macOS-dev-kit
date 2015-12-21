#!/bin/bash

# DESCRIPTION
# Applies basic system settings.

# EXECUTION
printf "Cleaning default directories...\n"
rm -rf $HOME/Documents/*
rm -rf $HOME/Downloads/*

printf "Displayed computer name: "
  read DISPLAYED_COMPUTER_NAME

printf "Computer name: "
  read COMPUTER_NAME

printf "Setting system label and name...\n"
sudo scutil --set ComputerName $DISPLAYED_COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

printf "Setting default desktop image (3200x2000@300).\n"
sudo cp settings/default_desktop.jpg $HOME/Documents/default.jpg