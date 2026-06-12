function dotfile_addbin
    set resolved (path resolve $argv[1])
    7zz a $DOTFILE_HOME/cli/.local/bins.7z $resolved
    mv $resolved $DOTFILE_HOME/cli/.local/bin
end
