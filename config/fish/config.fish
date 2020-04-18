#
# Use bash to run shkd commands
#
set -U SXHKD_SHELL /usr/bin/bash

# Remove the useless Caps Lock key
setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps

# Starship
starship init fish | source


# Sane auto completion key bindings
bind \c] accept-autosuggestion
bind \t complete

# make sure awt works with bspwm
set -U _JAVA_AWT_WM_NONREPARENTING 1
set -U _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=3"

# send to clipboard pass manager
set -U PASSWORD_STORE_X_SELECTION primary

# Local bin Path, includes python, aws, others.
set PATH /home/ferrao/.local/bin ./bin $PATH

# Ruby Path
set PATH /home/ferrao/.gem/ruby/2.6.0/bin $PATH

# Idea Path
set PATH /opt/idea-IU-193.6494.35/bin $PATH

#
# Custom Aliases
#
alias reboot="sudo reboot"
alias halt="sudo poweroff"
alias more="less"
alias vi="vim"
alias vim="nvim"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias clear="clear"
alias claer="clear"
alias celar="clear"
