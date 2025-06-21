#!/bin/bash
mkdir -p ~/.local/bin
cp ./.bootstrap/comtrya-x86linux-v0.9.2 ~/.local/bin/comtrya
./.bootstrap/comtrya-x86linux-v0.9.2 -d ~/.dotfiles apply
