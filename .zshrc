export PATH="/usr/local/opt/flex/bin:$PATH"
export PATH="/usr/local/opt/libarchive/bin:$PATH"
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[orange]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b"
#.# zsh-syntax-highlighting
#
# Fish shell like syntax highlighting for Zsh
#
# @link: http://github.com/zsh-users/zsh-syntax-highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source  ~/.zshconf/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:
#vim key bindings
bindkey -v











export PATH="/usr/local/opt/curl/bin:$PATH"
