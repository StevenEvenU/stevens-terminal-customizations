# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/users/stevenevenu/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git bundler dotenv macos rake rbenv ruby autojump brew zsh-autosuggestions virtualenv virtualenvwrapper git-flow)

source $ZSH/oh-my-zsh.sh

# Custom aliases and functions
alias cloud="cd; cd library/mobile\ documents/com\~apple\~clouddocs/"
alias college="cloud; cd college"
alias cs="college;cd 2023_spring"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cls='clear'
alias buou="brew update && brew outdated && brew upgrade && brew cleanup"
alias npmou="npm outdated -g --depth=0 && npm update -g"
alias del="trash"
alias ls='colorls -h --group-directories-first'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias vim='nvim'
alias cv='vim ~/.config/nvim/init.vim'

function e() {
    echo "hello"
}

mkcd () {
  mkdir "$1"
  cd "$1"
}

# Environment variables
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Additional configurations
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$(brew --prefix)/bin:$PATH"

# Conda configuration
__conda_setup="$('/users/stevenevenu/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/users/stevenevenu/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/users/stevenevenu/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/users/stevenevenu/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Opam configuration
[[ ! -r /users/stevenevenu/.opam/opam-init/init.zsh ]] || source /users/stevenevenu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null

# Virtualenvwrapper configuration
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source $(which virtualenvwrapper.sh)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# Needs to be at the bottom
eval "$(starship init zsh)"
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(rbenv init - zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


fcd() {
    local dir
    dir=$(find ${1:-.} -type d -not -path '*/\/*' 2> /dev/null | fzf +m) && cd "$dir"
}
