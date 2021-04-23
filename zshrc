# Source zsh config files
for file in ~/.config/zsh/* 
do
	source $file
done

# Fuzzy File Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Z completion
source /usr/local/bin/zsh-z.plugin.zsh

# Keybindings and Auto Suggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey -e
zstyle ':completion:*' special-dirs true
bindkey '^]' autosuggest-accept

# Load starship
eval "$(starship init zsh)"
