# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

for file in ~/.{extra,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# ZSH_THEME="miloshadzic"

plugins=(git)

source $ZSH/oh-my-zsh.sh
