# dotfiles

Personal config files, linked into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/).
Works on Linux, WSL and macOS.

Each top-level folder is one package: `bash`, `herdr`, `nvim`, `tmux`, `yazi`.

## Install

Requires `git`. On WSL, run this inside WSL and keep the repo in your WSL home folder, not under `/mnt/c`.

```bash
git clone https://github.com/evinle/dotfiles ~/dotfiles && ~/dotfiles/install.sh
```

If the repo is already cloned, run `~/dotfiles/install.sh`.

The script installs Stow if it's missing (with `apt` or `brew`), which may ask for your password.
The apps themselves, such as herdr, are installed separately.

By default it links only `herdr`. To choose packages, name them:

```bash
~/dotfiles/install.sh herdr nvim tmux
```

Linking `bash` replaces your `~/.bashrc`, so check that you want that on the device first.

Any existing file that would be replaced is renamed to `<file>.bak.<timestamp>`.

## Check it worked

```bash
ls -l ~/.config/herdr/config.toml
```

The output should show an arrow pointing into `dotfiles`.

## Update

Files in `$HOME` are symlinks into this repo, so editing either one changes the same file.

To publish a change:

```bash
cd ~/dotfiles
git add -A
git commit -m "Describe the change"
git push
```

To get changes on another device:

```bash
cd ~/dotfiles
git pull
herdr server reload-config
```

If a package gains new files, rerun `~/dotfiles/install.sh <package>` to link them.

## Set up each new clone

Git identity isn't stored in the repo. Run this once per clone to keep your email out of commits:

```bash
git -C ~/dotfiles config user.email "49425660+evinle@users.noreply.github.com"
```

## Undo

```bash
cd ~/dotfiles
stow --delete --target="$HOME" herdr
```

Then rename the `.bak.<timestamp>` file back if you want your old config.
