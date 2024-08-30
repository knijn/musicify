# Musicify

[![License badge](https://img.shields.io/github/license/RubenHetKonijn/musicify?style=flat-square)](https://github.com/knijn/musicify/blob/main/LICENSE)
[![Mentioned in Awesome ComputerCraft](https://awesome.re/mentioned-badge-flat.svg)](https://github.com/tomodachi94/awesome-computercraft)
[![CC: Tweaked Version: 1.100+](https://img.shields.io/badge/CC:%20tweaked-1.100+-green?style=flat-square&logo=GNOME%20Terminal)](https://tweaked.cc/)

Musicify is a command line utility for ComputerCraft:Tweaked to stream\* songs in game.

## Install

To install, run

```shell
wget run https://raw.githubusercontent.com/knijn/musicify/main/install.lua
```


# Codespaces

To develop under Codespaces, you'll need the CraftOS VSCode Extention and install CraftOS-PC with the following commands:
```sh
sudo add-apt-repository ppa:jackmacwindows/ppa
sudo apt update
sudo apt install craftos-pc
```

## License

Musicify is licensed under the [GNU General Public License v3.0](LICENSE).

## Commands

### musicify help
Shows the help menu showing all commands

### musicify list
Shows all of the playable songs in the repository set

### musicify info
Displays info about the current version of Musicify, and about the repository set

### musicify play <id>
Plays the song with the specified ID

### musicify playlist <file>
A playlist file has the following format: `<songid>,<songid>,<songid>,<songid>`. These song IDs can be found using musicify list. And can also be URLs.

## musicify gui
Show an in development GUI

## musicify shuffle [from] [to]
Shuffle the songs in the repository, and optionally from and to a specific song id

## musicify update
Forces an update on Musicify

## musicify loop <id>
Loops over a specific song or URL

## musicify url <url>
Plays a specific URL

## Setup

Set up your Computer with the install command above. Make sure to have a speaker and a modem (or ender modem) attached if you want to use multiple speakers

Musicify offers the following configuration options:
- `musicify.repo`: Sets the repo to music load from (default: `https://raw.githubusercontent.com/knijn/musicify-songs/main/index.json`)
- `musicify.autoUpdates`: Sets whether Musicify will automatically update when there's a new version. (default: `true`)
- `musicify.serverChannel`: Sets the channel to broadcast audio packets on
- `musicify.serverMode`: Sets whether Musicify will broadcast audio packets

## Development

The program also should work as an api, this is not tested though.
If you want to support the program, please make a pull request. It helps out a ton!

If you want to run the development version of Musicify, run

```shell
wget run https://raw.githubusercontent.com/knijn/musicify/mian/git_install.lua
```
