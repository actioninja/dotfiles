function dotfile_addbin
    set resolved (path resolve $argv[1])
    7zz a -mx=9 m0=LZMA2 -mmt=on $DOTFILE_HOME/cli/.local/bins.7z $resolved
    mv $resolved $DOTFILE_HOME/cli/.local/bin
end
