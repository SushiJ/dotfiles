set fish_greeting ""
set -gx COLORTERM truecolor


set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"

set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" "/usr/sbin" "/home/sushi/.config/emacs/bin" "/home/sushi/.local/bin" "/home/sushi/development/flutter/bin" "/home/sushi/git/emsdk/upstream/bin" "/home/sushi/.dotnet/" "/home/sushi/.local/share/nvim/mason/bin" "/home/sushi/Android/Sdk/platform-tools" "/home/sushi/.local/share/nvim/mason/bin" $PATH

set -q MANPATH; or set MANPATH ''
set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
set -q INFOPATH; or set INFOPATH ''
set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
set -gx EDITOR "nvim"
set -gx ANDROID_HOME "/home/sushi/Android/Sdk"

alias emsdk_setup ". ~/git/emsdk/emsdk_env.fish"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias dev="cd ~/nix-home/sushi/dev/"
alias p="pnpm"
alias dots="cd ~/.dotfiles"
alias emacs="emacs -nw"
alias z="zypper"
alias sz="sudo zypper"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export MANPAGER "nvim +Man!"

# pnpm
set -gx PNPM_HOME "/home/sushi/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
