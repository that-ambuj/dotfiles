setopt appendhistory inc_append_history share_history extended_history bang_hist hist_ignore_all_dups
setopt autocd autopushd pushdignoredups extendedglob nomatch autolist

autoload -U compinit
compinit

bindkey '^H' backward-kill-word
# setopt -s histappend
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="$HOME/.zsh_history"

alias ls="exa -1F"
alias cl=clear
alias md=mkdir
alias lz=lazygit


if [ ${PS1+set} ]; then
    export CDPATH=.:$HOME/personal-projects:$HOME/open-source:$HOME/dotfiles:$HOME/work
fi

mkcd () {
    mkdir "$1"
    cd "$1"
}


alias sctl='setxkbmap -option "ctrl:swap_lalt_lctl"'
alias scap='setxkbmap -option "ctrl:nocaps"'

alias gogh='bash -c "$(wget -qO- https://git.io/vQgMr)"'

alias us-vpn='nmcli c up us-free-21.protonvpn.net.tcp passwd-file ~/.vpn-passwd'
alias us-vpn-down='nmcli c down us-free-21.protonvpn.net.tcp' 

. "$HOME/.cargo/env"

source <(/home/ambuj/.cargo/bin/starship init zsh --print-full-init)

source <(cargo shuttle generate --shell zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatically start TMUX, if it's not set
if [[ ! -v ZSH_TMUX_AUTOSTART ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi

export PATH="$HOME/go/bin:$HOME/.yarn/bin:$HOME/.local/bin:$PATH"

export DOTNET_ROOT="$HOME/.dotnet"

export PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"


# Android Stuff
# export ANDROID_HOME=$HOME/Android/Sdk/

# export ANDROID_HOME=$HOME/.cmdtools
# export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"
# export PATH="$PATH:$HOME/.cmdtools/cmdline-tools/latest/bin:$HOME/.cmdtools/build-tools/33.0.2:$HOME/.cmdtools/build-tools/30.0.3:$HOME/.cmdtools"

export PATH="$PATH:$HOME/bin:/home/ambuj/bin"

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH=$JAVA_HOME/bin:$PATH


export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

export DOCKER_HOST=unix:///run/user/1000/docker.sock

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ambuj/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ambuj/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ambuj/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ambuj/google-cloud-sdk/completion.zsh.inc'; fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/fzf-completion.zsh ] && source ~/.zsh/fzf-completion.zsh
[ -f ~/.zsh/fzf-key-bindings.zsh ] && source ~/.zsh/fzf-key-bindings.zsh
[ -f ~/.zsh/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

export PATH="$PATH:$HOME/.ghcup/ghc/9.6.2/bin:$HOME/.ghcup/hls/2.0.0.1/bin:$HOME/.ghcup/bin"

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# export PATH="$PATH:$HOME/.zvm/master"

export PATH="$PATH:$HOME/.config/emacs/bin"

source $HOME/.zsh/colored-man-pages-zsh.plugin.zsh 

# export TERMINAL=kitty

alias hx=helix
alias chrome=chromium

alias nvim=helix

# set default browser
unset BROWSER
BROWSER=chromium

# Load Angular CLI autocompletion.
source <(ng completion script)

echo ambuj | figlet -f slant

# Turso
export PATH="/home/ambuj/.turso:$PATH"

# opam configuration
[[ ! -r /home/ambuj/.opam/opam-init/init.zsh ]] || source /home/ambuj/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
