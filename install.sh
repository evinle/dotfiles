#!/bin/sh
# Link dotfiles into $HOME with GNU Stow.
# Usage: ./install.sh [package ...]    (default: herdr)
# Existing files that would conflict are renamed to <file>.bak.<timestamp>.
set -eu
cd "$(dirname "$0")"
[ $# -gt 0 ] || set -- herdr

if ! command -v stow >/dev/null 2>&1; then
    if command -v brew >/dev/null 2>&1; then brew install stow
    elif command -v apt-get >/dev/null 2>&1; then sudo apt-get install -y stow
    else echo "Please install GNU Stow, then rerun." >&2; exit 1
    fi
fi

stamp=$(date +%Y%m%d%H%M%S)
for pkg in "$@"; do
    [ -d "$pkg" ] || { echo "No such package: $pkg" >&2; exit 1; }
    # Create parent directories first so Stow links files, not whole directories.
    # This keeps runtime files (herdr's sockets, logs, sessions) out of the repo.
    (cd "$pkg" && find . \( -type f -o -type l \) | sed 's|^\./||') | while IFS= read -r rel; do
        dest="$HOME/$rel"
        mkdir -p "$(dirname "$dest")"
        if [ -e "$dest" ] && [ ! -L "$dest" ]; then
            mv "$dest" "$dest.bak.$stamp"
            echo "Backed up $dest to $dest.bak.$stamp"
        fi
    done
    stow --restow --target="$HOME" "$pkg"
    echo "Linked $pkg"
done

if command -v herdr >/dev/null 2>&1; then
    herdr server reload-config >/dev/null 2>&1 || true
fi
