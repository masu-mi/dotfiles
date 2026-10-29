# masu_mi/dotfiles

## Setup

Clone to `~/dotfiles` (rc files assume this path).

```sh
git clone https://github.com/masu-mi/dotfiles.git ~/dotfiles
~/dotfiles/scripts/setup.sh   # pkgs -> mise -> make init -> mise install -> go/npm tools
```

Packages come from `scripts/pkgs/*.txt` via apt, or `*.brew.txt` via brew on macOS (needs Homebrew; override with `PKG_MANAGER=apt|brew`).

`make init` symlinks configs into `$HOME`, moving any existing regular file to `*.bak`.

## Make

```sh
make         # list targets
make init    # set everything up
make clean   # remove the symlinks
```
