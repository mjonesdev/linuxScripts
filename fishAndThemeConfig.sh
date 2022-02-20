#!/bin/bash

############################################
# Do not run with sudo
# Only run after software installs
# Must be run after Fish has been manually started for the first time. Recommended to run using Fish to ensure config files in .config
# Must open gnome-tweaks before running this script
############################################

# Fish config
chsh -s /bin/fish;
cat << EOF >> ~/.config/fish/config.fish
function fish_prompt
    powerline-shell --shell bare $status
end

neofetch
EOF

# Configure theme
## You can use "dconf watch /" to find the commands required to programmatically add other options
gsettings set org.gnome.shell enabled-extensions "['background-logo@fedorahosted.org', 'user-theme@gnome-shell-extensions.gcampax.github.com']";
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-darker-v40';
gsettings set org.gnome.shell.extensions.user-theme name 'Nordic-darker-v40';
gsettings set org.gnome.desktop.interface icon-theme 'Zafiro-Icons-Dark-Blue-f';
gsettings set org.gnome.desktop.background picture-uri 'file:///home/matt/.themes/941435.png';
