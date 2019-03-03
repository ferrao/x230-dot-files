#
# Custom Paths 
#

# Fuzzy File Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Node Path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby Path
export PATH=$PATH:/home/ferrao/.gem/ruby/2.6.0/bin

# Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
