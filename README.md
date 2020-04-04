# The Voidrice (Luke Smith <https://lukesmith.xyz>'s dotfiles)

These are the dotfiles deployed by [LARBS](https://larbs.xyz) and as seen on [my YouTube channel](https://youtube.com/c/lukesmithxyz).

- Very useful scripts are in `~/.local/bin/`
- Settings for:
	- vim/nvim (text editor)
	- zsh (shell)
	- i3wm/i3-gaps (window manager)
	- i3blocks (status bar)
	- sxhkd (general key binder)
	- ranger (file manager)
	- lf (file manager)
	- mpd/ncmpcpp (music)
	- sxiv (image/gif viewer)
	- mpv (video player)
	- calcurse (calendar program)
	- tmux
	- other stuff like xdg default programs, inputrc and more, etc.
- I try to minimize what's directly in `~` so:
	- All configs that can be in `$XDG_CONFIG_HOME/` are.
	- Some environmental variables have been set in `~/.zprofile` to move configs into `$XDG_CONFIG_HOME/`
- Bookmarks in text files used by various scripts (like `~/.local/bin/shortcuts`)
	- File bookmarks in `$XDG_CONFIG_HOME/files`
	- Directory bookmarks in `$XDG_CONFIG_HOME/directories`

## Want even more?

My setup is pretty modular nowadays.
I use several suckless programs that are meant to be configured and compiled by the user and I also have separate repos for some other things.
Check out their links:

- [dwm](https://github.com/lukesmithxyz/dwm) (the window manager I usually use now which is fully compatible with this repo)
- [st](https://github.com/lukesmithxyz/st) (the terminal emulator assumed to be used by these dotfiles)
- [mutt-wizard (`mw`)](https://github.com/lukesmithxyz/mutt-wizard) - (a terminal-based email system that can store your mail offline without effort)

## Install these dotfiles

Use [LARBS](https://larbs.xyz) to autoinstall everything:

```
curl -LO larbs.xyz/larbs.sh
```

or clone the repo files directly to your home directory and install [the prerequisite programs](https://github.com/LukeSmithxyz/LARBS/blob/master/progs.csv) or [those required for the i3 setup](https://github.com/LukeSmithxyz/LARBS/blob/master/legacy.csv).
