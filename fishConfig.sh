#!/bin/bash

############################################
# Only run after software installs
# Must be run after Fish has been manually started for the first time. Recommended to run using Fish to ensure config files in .config
############################################

# Fish config
chsh -s /bin/fish;
cat << EOF >> ~/.config/fish/fish.config
function fish_prompt
    powerline-shell --shell bare $status
end

neofetch
EOF