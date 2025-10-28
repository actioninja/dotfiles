if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    cowfortune
end

fish_vi_key_bindings
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

if command -q nix-your-shell
    nix-your-shell fish | source
end

mise activate fish | source

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
carapace _carapace fish | source

set sponge_purge_only_on_exit true

test -r $__fish_config_dir/dircolors; and eval (dircolors $__fish_config_dir/dircolors | sed 's/^LS_COLORS=/set -x LS_COLORS /; s/;$//')


function __tide_mise_hack -v PWD
    _tide_remove_unusable_items
end
