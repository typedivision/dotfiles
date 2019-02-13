#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

if [ "$COLORTERM" = "mate-terminal" ]; then
  export TERM=xterm-256color
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export VISUAL=vim
export EDITOR="$VISUAL"

alias mcd='. $(brew --prefix mc)/libexec/mc/mc-wrapper.sh'
alias vip='vimpager -u ~/.config/nvim/init.vim'
alias  ta='tig --all'
alias  ts='tig status'
alias fzp='fzf --preview '\''[[ $(file --mime {}) =~ binary ]] && echo binary file || (highlight -s division -O xterm256 -l {} || cat {}) 2>/dev/null | head -200'\'
alias  ag='ag --color-line-number "30;1" --color-path "34;1" --color-match "32;1"'
alias agx='ag --color-line-number "30;1" --color-path "34;1" --color-match "32;1" --hidden --silent -a'
alias agt='ag --color-line-number "30;1" --color-path "34;1" --color-match "32;1" --hidden --silent -t'
alias fdx='fd --follow --hidden --no-ignore --exclude ".git"'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

zle_highlight+=(paste:none)

eval $(dircolors -p | sed -r 's/^((CAP|S[ET]|O[TR]|M|E)\w+).*/\1 00/' | dircolors -)
export GREP_COLORS='mt=01;32'

# added by $(brew --prefix fzf)/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
