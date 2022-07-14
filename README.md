
# Git Watcher and Builder

Have you ever felt the need of compiling multiple jar files, then wait dozens of minutes for them to complete and then look for them in build folders, taking more time? Plus even watch them for new updates?

This tool provides automatic watching, compilation and gathering jar files from most GitHub repositories using Gradle and a tool from kolbasa for watching git repos. I built this project for my Minecraft server because it takes around 30 mins to even find over 60 plugins, apart from building jar files.



## Perquisites

- <kbd>bash</kbd>
- <kbd>git</kbd>
- <kbd>wget</kbd>
- <kbd>unzip</kbd>

Some things require Java 17 to be installed.
## Installation

To get started, clone this project:

```bash
  git clone https://github.com/DemsarMa/git-watcher-builder.git
```
Run `install.sh` only once to install example repositories.
Upon running `main.sh` for the first time, it will create a `builds` directory for storing jar files.

## Usage

Run `main.sh` to execute watchers, execute screen sessions and kill old screen sessions. The script will exit, but you can always check watchers by going to the specific screen:
```bash
screen -r <repo_name>
```

If you've made any changes to any hook file, you have to re-run `main.sh` to refresh watchers.

If you want to add more repos, clone it first, then add the following into the code respectively:
```bash
screen -S <repo_name> -X stuff './git-repo-watcher -d repos/<repo_name>" -h repos/hooks/<repo_name>^M'
```

Then create a new hook file for building, look https://github.com/kolbasa/git-repo-watcher#customizations for more info (Thank you [@kolbasa](https://github.com/kolbasa) for providing the watcher component). Don't forget to add a new screen session for the new watcher:

```bash
screen -dmS <repo_name>
```

Note: Some repositories doesn't have Gradle compiler, you can add the repository for the watcher to look and a CI link to get the jar from (Example: ViaVersion), or try with a tool [Nightly](https://nightly.link) (thank you [@oprypin](https://github.com/oprypin)!).

## Feedback

If you have any feedback or ideas, share them in [discussions](https://github.com/DemsarMa/git-watcher-builder/discussions).

Have you found an issue? Report it [here](https://github.com/DemsarMa/git-watcher-builder/issues), or you can DM me on Discord: `MtkoGaming_TW#0001`


## Roadmap

- Ability to add GitHub repositories without adding them in the code (using prefixes and a template)
- Automatic watching on [SpigotMC](https://spigotmc.org) for new updates
- Separated watchers when restarting (to not restart all of them) (using options)
- Notifying upon successful/failed builds via webhook or on Discord.
## Contributing

All contributions are more than welcome. You can first look on a [roadmap](https://github.com/DemsarMa/git-watcher-builder#roadmap) if you want to implement new features or want to fix bugs/issues. To get started, open a Pull request.


## Authors

- [@DemsarMa](https://github.com/DemsarMa)

## Disclaimer

I am not affiliated by any plugin or repo devs in this project.
Some plugins introduced there are examples to show how it works.
