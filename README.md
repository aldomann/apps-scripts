# App Scripts

Scripts for app/repos management (GNU/Linux).
- `masterscript` is configured to work on Arch Linux based distributions.
- `masterscript-ubuntu` is configured to work on Ubuntu based distributions (unmaintained).

Original Author: [Sam Hewitt](https://github.com/snwh)

Feel free to fork this project, modify to suit your preference, and distribute.

##Structure

This project is coded and organized in a modular fashion so you can easily delete or exclude parts that you don't want to use.

##Usage

Simple, you just run the main script from the root of the source folder:
```bash
	./masterscript
```

Or you can store this scriptset in some directory, and add that location to your custom shell paths to run on-demand. For example, adding it as the following line to your `.bashrc` or `.zshrc` (editing the path appropriately):
```bash
	export PATH=${PATH}:$HOME/.scripts/
```
