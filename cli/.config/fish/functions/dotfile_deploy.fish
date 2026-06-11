function dotfile_deploy
    switch $argv[1]
    case cli
        source "$DOTFILE_HOME"cli/.config/fish/_dotfile_deploy_cli.fish
    case desktop
        source "$DOTFILE_HOME"cli/.config/fish/_dotfile_deploy_cli.fish
        source "$DOTFILE_HOME"cli/.config/fish/_dotfile_deploy_desktop.fish
    case '*'
        echo "use cli or desktop"
    end
end
