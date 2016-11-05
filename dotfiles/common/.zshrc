# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
#bindkey '^G' send-break
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yucca/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [[ $TERMINIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi

source ~/.zplug/init.zsh

zplug "willghatch/zsh-cdr"

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/fizsh"
zplug "zsh-users/zaw"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/archlinux",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "plugins/extact",   from:oh-my-zsh
zplug "plugins/python",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/fasd",   from:oh-my-zsh
zplug "plugins/dirhistory",   from:oh-my-zsh
zplug "plugins/history",   from:oh-my-zsh
zplug "plugins/systemd",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh
zplug "plugins/web-search",   from:oh-my-zsh
zplug "plugins/dircycle",   from:oh-my-zsh

#Themes
setopt prompt_subst # Make sure propt is able to be generated properly.
zplug "caiogondim/bullet-train-oh-my-zsh-theme"

# Also prezto
# zplug "modules/prompt", from:prezto

# Set the priority when loading
# # e.g., zsh-syntax-highlighting must be loaded
# # after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "willghatch/zsh-zaw-mpd", nice:10
#
# # Can manage local plugins
# zplug "~/.zsh", from:local
#
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install? [y/N]: "
          if read -q; then
             echo; zplug install
          fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose
