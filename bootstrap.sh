#!/usr/bin/env bash

scriptdir=$(cd "$(dirname -- "$0")" ; pwd -P)

rm -rf ~/.config/fish
ln -sfv "${scriptdir}/cli/.config/fish" ~/.config/fish

"${scriptdir}/cli/.local/bin/fish" "dotfile_deploy cli"
