if type -q exa
  function ls --wraps='exa --icons' --description 'alias ls exa --icons'
    exa --icons $argv
  end
end
