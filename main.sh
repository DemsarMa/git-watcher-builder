#/usr/bin/bash

# Upon starting, file "install.sh" NEEDS to be run
# at least once before starting "main.sh"!

# Builds are headed to repos/builds
# In case you want to add more repos, clone 
# them in repos directory, copy/paste screen command executor component (Example: screen -S <repo_name> -X stuff './git-repo-watcher -d repos/<repo_name>" -h repos/hooks/<repo_name>^M'). 
# Then create a new hook file for building, look 
# https://github.com/kolbasa/git-repo-watcher for more info.
# Don't forget to add screen session lines respectively
# (Example: `screen -dmS <repo_name>`)

echo "Starting up..."

if [[ -d "./builds" ]]; 
then
    echo "Found directory builds"
else
echo "Builds directory not found, creating..."
mkdir builds
fi

if screen -list | egrep "viav|essx|protocol|eco|geyser"; then
    echo "Found all screens, refreshing..."
    screen -X -S viav quit
    screen -X -S essx quit
    screen -X -S protocol quit
    screen -X -S eco quit
    screen -X -S geyser quit
    screen -dmS viav
    screen -dmS essx
    screen -dmS protocol
    screen -dmS eco
    screen -dmS geyser
else
screen -dmS viav
screen -dmS essx
screen -dmS protocol
screen -dmS eco
screen -dmS geyser
fi

screen -S viav -X stuff './git-repo-watcher -d "repos/ViaVersion" -h "repos/hooks/viaversion"^M'
echo "Started watching ViaVersion for changes!"

screen -S essx -X stuff './git-repo-watcher -d "repos/EssentialsX" -h "repos/hooks/essentialsx"^M'
echo "Started watching EssentialsX for changes!"

screen -S protocol -X stuff './git-repo-watcher -d "repos/ProtocolLib" -h "repos/hooks/protocollib"^M'
echo "Started watching ProtocolLib for changes!"

screen -S eco -X stuff './git-repo-watcher -d "repos/eco" -h "repos/hooks/eco"^M'
echo "Started watching eco for changes!"

screen -S geyser -X stuff './git-repo-watcher -d "repos/Geyser" -h "repos/hooks/geyser"^M'
echo "Started watching Geyser for changes!"
screen -list
echo "Builds will be exported to $HOME/repos/builds upon new changes!"
echo "Run this file again if you made changes to any hook files or this file!"