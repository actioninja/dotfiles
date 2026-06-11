function dotify
    if not test (count $argv) -eq 2
        echo "Needs 2 args"
        return
    end
    set deployment $argv[1]
    set target (path resolve $argv[2])
    if not string match (path resolve $HOME)"/*" $target
        echo "target not in home directory"
        return
    end
    set relative_from_root (string sub -s (math (string length "$HOME"/) + 1) $target)
    mkdir -p $DOTFILE_HOME/$deployment/(path dirname $relative_from_root)
    mv $target $DOTFILE_HOME/$deployment/$relative_from_root
    set link_command "dotfile_link $deployment/$relative_from_root ~/$relative_from_root"
    echo $link_command >> $DOTFILE_HOME/cli/.config/fish/_dotfile_deploy_"$deployment".fish
    eval $link_command
end
