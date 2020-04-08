#
# Custom Alias
#
alias reboot="sudo reboot"
alias halt="sudo poweroff"
alias more="less"
alias vim="nvim"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias clear="clear"
alias claer="clear"
alias nocaps="setxkbmap -layout us -option ctrl:nocaps"

# Starship
starship init fish | source

# Sane auto completion key bindings
bind \c] accept-autosuggestion
bind \t complete

# make sure awt works with bspwm
set -U _JAVA_AWT_WM_NONREPARENTING 1

# send to clipboard pass manager
set -U PASSWORD_STORE_X_SELECTION primary

# Local bin Path, includes python, aws, others.
set PATH /home/ferrao/.local/bin ./bin $PATH

# Ruby Path
set PATH /home/ferrao/.gem/ruby/2.6.0/bin $PATH

# Idea Path
set PATH /opt/idea-IU-193.6494.35/bin $PATH
