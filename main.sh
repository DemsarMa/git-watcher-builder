#/usr/bin/bash

# Upon starting, all repos NEEDS to be cloned at least once in repos directory!

# Builds are headed to repos/builds
# In case you want to add more repos, clone them in repos directory, copy lines from 26 to 27 and paste respectively after 42nd line (Example: `screen -S <repo_name> -X stuff './git-repo-watcher -d ~/repos/<repo_name>" -h ~/repos/hooks/<repo_name>\n'` Then create a new hook file for building, look https://github.com/kolbasa/git-repo-watcher for more info. Also add new line after 22nd and add a new screen session (Example: `screen -dmS <repo_name>`)

echo "Starting up..."

mkdir -p builds
screen -X -S ecob quit
screen -X -S ecoe quit
screen -X -S plotq quit
screen -X -S title quit
screen -X -S geyser quit
screen -X -S protocol quit
screen -dmS ecob
screen -dmS ecoe
screen -dmS plotq
screen -dmS title
screen -dmS geyser
screen -dmS protocol

cd git-repo-watcher

screen -S ecob -X stuff './git-repo-watcher -d ~/repos/EcoBosses" -h ~/repos/hooks/ecobosses\n'
echo "Started watching EcoBosses for changes!"

screen -S ecoe -X stuff './git-repo-watcher -d ~/repos/EcoEnchants" -h ~/repos/hooks/ecoenchants\n'
echo "Started watching EcoEnchants for changes!"

screen -S plotq -X stuff './git-repo-watcher -d ~/repos/PlotSquared" -h ~/repos/hooks/plotsquared\n'
echo "Started watching PlotSquared for changes!"

screen -S title -X stuff './git-repo-watcher -d ~/repos/TitleManager" -h ~/repos/hooks/titlemanager\n'
echo "Started watching TitleManager for changes!"

screen -S geyser -X stuff './git-repo-watcher -d ~/repos/Geyser" -h ~/repos/hooks/Geyser\n'
echo "Started watching Geyser for changes!"

screen -S protocol -X stuff './git-repo-watcher -d ~/repos/ProtocolLib" -h ~/repos/hooks/protocollib\n'
echo "Started watching ProtocolLib for changes!"
session -list
echo "Builds will be exported to $HOME/repos/builds upon new changes!"
