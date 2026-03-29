function dotfile_deploy
    switch $argv[1]
    case cli
        mkdir -p ~/.config
        mkdir -p ~/.local
        mkdir -p ~/Projects
        mkdir -p ~/Downloads
        dotfile_link cli/.local/bin ~/.local/bin
        dotfile_link cli/.config/git ~/.config/git
        dotfile_link cli/.config/cargo ~/.config/cargo
        dotfile_link cli/.config/jj ~/.config/jj
        dotfile_link cli/.config/fish ~/.config/fish
    case desktop
        echo "nothing yet"
    case '*'
        echo "use cli or desktop"
    end
end
