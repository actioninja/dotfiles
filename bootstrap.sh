#!/usr/bin/env bash

scriptdir=$(cd "$(dirname -- "$0")" ; pwd -P)

rm -rf ~/.config/fish
ln -sfv "${scriptdir}/cli/.config/fish" ~/.config/fish
$scriptdir/cli/.local/bin/7zz e -y -o$scriptdir/cli/.local/bin/ $scriptdir/cli/.local/bins.7z

$scriptdir/cli/.local/bin/fish -c "dotfile_deploy cli"
