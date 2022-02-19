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
sudo dnf install code -y;

# Confirm VSCode installation
echo "VSCode details: ";
rpm -qi code;

# Install pip

sudo dnf clean all;
sudo dnf install python-pip -y;

# Terminator install

sudo dnf install terminator -y;

# Fish and other terminal extensions installs

sudo dnf install fish -y;
pip install powerline-shell;
sudo dnf install neofetch -y;
sudo dnf install util-linux-user -y;

# Fish config

sudo chsh -s /bin/fish;
cat << EOF >> ~/.config/fish/fish.config
function fish_prompt
    powerline-shell --shell bare $status
end

neofetch
EOF

# Anaconda install

# Anaconda config

# PGAdmin

sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm;
sudo dnf install pgadmin4-desktop -y;

# Theme setup

sudo dnf install gnome-tweaks -y;

## move resources to new directories
mkdir .themes;
mv linuxScripts/theme_files/Nodic-darker-v40 ./.themes;
