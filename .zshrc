setopt appendhistory inc_append_history share_history extended_history bang_hist hist_ignore_all_dups
setopt autocd autopushd pushdignoredups extendedglob nomatch autolist

autoload -U compinit
compinit

bindkey '^H' backward-kill-word
# setopt -s histappend
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="$HOME/.zsh_history"

alias cl=clear
alias md=mkdir
alias lz=lazygit
alias ar="php artisan"

if [ ${PS1+set} ]; then
    export CDPATH=.:$HOME/personal-projects:$HOME/open-source:$HOME/dotfiles:$HOME/work
fi

mkcd () {
    mkdir "$1"
    cd "$1"
}

source <(starship init zsh --print-full-init)

alias sctl='setxkbmap -option "ctrl:swap_lalt_lctl"'
alias scap='setxkbmap -option "ctrl:nocaps"'

alias gogh='bash -c "$(wget -qO- https://git.io/vQgMr)"'

. "$HOME/.cargo/env"

# source <(cargo shuttle generate --shell zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatically start TMUX, if it's not set
if [[ ! -v ZSH_TMUX_AUTOSTART ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi

export PATH="$HOME/go/bin:$HOME/.yarn/bin:$HOME/.local/bin:$PATH"

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

# export DOCKER_HOST=unix:///run/user/1000/docker.sock

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ambuj/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ambuj/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ambuj/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ambuj/google-cloud-sdk/completion.zsh.inc'; fi

# [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.zsh/fzf-completion.zsh ] && source $HOME/.zsh/fzf-completion.zsh
[ -f $HOME/.zsh/fzf-key-bindings.zsh ] && source $HOME/.zsh/fzf-key-bindings.zsh
[ -f $HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh ] && source $HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh

export PATH="$PATH:$HOME/.ghcup/ghc/9.6.2/bin:$HOME/.ghcup/hls/2.0.0.1/bin:$HOME/.ghcup/bin"

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# export PATH="$PATH:$HOME/.zvm/master"

export TERMINAL=kitty

# alias hx=helix

# Load Angular CLI autocompletion.
# source <(ng completion script)

echo ambuj | figlet -f slant

# add npm global packages to path on mac os
export PATH="$PATH:/opt/homebrew/lib"

export DOCKER_DEFAULT_PLATFORM=linux/amd64
