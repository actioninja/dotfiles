function dotfile_link
    set -l resolved (realpath -s $argv[2])
    mkdir -p (path dirname $resolved)
    rm -rf $resolved
    ln -sfv "$DOTFILE_HOME"$argv[1] $resolved
end
