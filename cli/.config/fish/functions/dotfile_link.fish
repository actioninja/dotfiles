function dotfile_link
    rm -rf $argv[2]
    ln -sfv "$DOTFILE_HOME"$argv[1] $argv[2]
end
