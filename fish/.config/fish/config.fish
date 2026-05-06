set fish_greeting ""
set -gx COLORTERM truecolor

set -gx PATH "/usr/sbin" "/home/sushi/.local/bin" "/home/sushi/development/flutter/bin" "/home/sushi/.local/share/nvim/mason/bin" "/home/sushi/Android/Sdk/platform-tools" "/home/sushi/Android/Sdk/cmdline-tools/latest/bin" "/home/sushi/.local/share/kvim/mason/bin" $PATH

set -gx CHROME_EXECUTABLE "/usr/sbin/google-chrome-stable"
set -gx EDITOR "nvim"
set -gx ANDROID_HOME "/home/sushi/Android/Sdk"

# Alias
if type -q eza
  alias ls "eza -l -g --icons"
  alias la "ls -a"
  alias l "ls"
end

if type -q bat
  alias cat "bat"
end

# alias emsdk_setup ". ~/git/emsdk/emsdk_env.fish"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias p="pnpm"
alias dev="cd code"
alias px="pnpm dlx"
alias wmrc="cd ~/.config/i3 && nvim config"
alias conf="cd ~/.config && nvim config"
alias dots="cd ~/.dotfiles"
alias emacs="emacs -nw"
alias sadf="cd ~/code/sadf"
alias firefox="firefox-developer-edition"

zoxide init fish | source

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

# mise activate fish | source
mise activate fish | source

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/sushi/.local/share/coursier/bin"
# <<< coursier install directory <<<

if test -d $HOME/.nix-profile/share/fish/completions
    set -gp fish_complete_path $HOME/.nix-profile/share/fish/completions
end

if test -d $HOME/.nix-profile/share/fish/vendor_completions.d
    set -gp fish_complete_path $HOME/.nix-profile/share/fish/vendor_completions.d
end

if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/sushi/.opam/opam-init/init.fish' && source '/home/sushi/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
