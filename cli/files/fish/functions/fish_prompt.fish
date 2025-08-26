
function fish_prompt
        set -l last_status $status
    
        set -l normal (set_color normal)
        set -l usercolor (set_color $fish_color_user)
        
        set -l separator \UE0B4
    
        set -l delim_separator (set_color white) $normal $separator

        set -l k8s_present false
        command -sq kubectl; and set k8s_present true
    
        # Prompt status only if it's not 0
        set -l prompt_status
        if test $last_status -ne 0;
                set prompt_status (set_color white) (set_color -b $fish_color_status) " [$last_status] " (set_color -b normal) (set_color $fish_color_status) \UE0B4
                set delim_separator (set_color white) (set_color -b $fish_color_status) $separator
        end
   
        set -l delim (set_color -b white) (set_color black) " \$ " $delim_separator
        fish_is_root_user; and set delim (set_color -b white) (set_color black) " # " $delim_separator


        # Only show host if in SSH or container
        # Store this in a global variable because it's slow and unchanging
        if not set -q prompt_host
                set -g prompt_host ""
                if set -q SSH_TTY
                        or begin
                                command -sq systemd-detect-virt
                                and systemd-detect-virt -q
                        end
                        set prompt_host $usercolor$USER$normal@(set_color $fish_color_host)$hostname$normal":"
                end
        end
    
        set -l pwd_color brblue

        # Shorten pwd if prompt is too long
        set -l pwd (set_color -b $pwd_color) (set_color white) " " (prompt_pwd) " " (set_color -b white) (set_color $pwd_color) $separator

        set -l k8s_context
        if test $k8s_present = true
                set -l next_color normal
                test $last_status -ne 0; and set next_color $fish_color_status
                set k8s_context (set_color black) (set_color -b yellow) " " "example_context" " " (set_color -b $next_color) (set_color yellow) $separator
        end

    
        echo -n -s $prompt_host $pwd $k8s_context $prompt_status $normal " "
end
