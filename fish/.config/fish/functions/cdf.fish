function cdf
    set selected (find ~/code -mindepth 2 -maxdepth 2 -type d | fzf)
    if test -n "$selected"
        cd "$selected"
    end
end
