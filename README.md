# zsh-cwd

`zsh-cwd` records directory changes in all shells and lets you change to the latest working directory.

# Usage

As you change directory the path will be stored in a state file (default `~/.cwd`). You can use `cwd` to
change the current working directory to the latest state.

This allows you to open a new terminal at the last known working directory.

To force a directory path to be written to the state you can use `rwd`. This can be helpful if you have 
recently changed directory somewhere but now want to make sure the current working directory is recorded 
as the latest working directory.

# Installation

## oh-my-zsh

1. Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)
   ```sh
   git clone https://github.com/pjvds/zsh-cwd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-cwd
   ```

2. Add the plugin to the list of plugin for Oh My Zsh to load (inside `~/.zshrc`):
   ```sh
   plugins=(zsh-cwd)
   ```

## antigen

If you use [antigen](https://github.com/zsh-users/antigen) as a plugin manager for zsh, all you have to do is to put the following in your `.zshrc`:

```
antigen bundle pjvds/zsh-cwd
```

## zplug

If you use [zlplug](https://github.com/zplug/zplug) as a plugin manager for zsh, all you have to do is to put the following in your `.zshrc`:

```
zplug "pjvds/zsh-cwd"
```

## Manual

Otherwise, to install it manually execute the following lines you shell:

```
git clone https://github.com/pjvds/zsh-cwd ~/.zsh-cwd
echo "source ~/.zsh-cwd/zsh-cwd.plugin.zsh" >> ~/.zshrc
```
