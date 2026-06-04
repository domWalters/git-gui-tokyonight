#!/bin/sh
set -eu

repo="$HOME/.config/git-gui"

if [ ! -d "$repo/.git" ]; then
	git clone https://github.com/domWalters/git-gui-tokyonight "$repo"
fi

cd "$(git --exec-path)"
if grep -q style_during_apply_config git-gui; then
  echo 'Already applied patch, skipping'
else
  sudo patch -l -N < "$repo/git-gui.patch"
fi
