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

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
carapace _carapace fish | source

mise activate fish | source

set sponge_purge_only_on_exit true

test -r $__fish_config_dir/dircolors; and eval (dircolors $__fish_config_dir/dircolors | sed 's/^LS_COLORS=/set -x LS_COLORS /; s/;$//')
