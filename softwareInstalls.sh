#!/bin/bash

##########################################
# Script to install packages onto new Fedora workstation
# Written by Matt Jones
##########################################

# Update repositories and system
sudo dnf update -y;
sudo dnf upgrade -y;

# Configure Git
echo "Time to configure Git: ";

echo "What is the required global username for Git? ";
read GITGLOBALUSER;
git config --global user.name "${GITGLOBALUSER}";

echo "what is the global email for Git? ";
read GITGLOBALEMAIL;
git config --global user.email "${GITGLOBALEMAIL}";

echo "Git configuration complete with the following: ";
git config --list;

# Install software
echo "Time to install software";

# Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
  
cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf update -y;
sudo dnf install code;

# Confirm installation
echo "VSCode details: ";
rpm -qi code;