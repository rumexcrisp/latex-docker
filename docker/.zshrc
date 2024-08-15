typeset -U PATH path
path=(	"$HOME/bin"
	"$HOME/.local/bin"
	"/bin"
	"/usr/bin"
	"/usr/bin/vendor_perl"
	"/usr/sbin"
	"/usr/local/bin"
	"/usr/local/sbin"
)
export PATH
EDITOR=nvim
export EDITOR

# autocompletion
autoload -Uz compinit 
compinit
zmodload zsh/complist
zstyle ':completion:*' menu select

# set key array to according keys
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
# history search
# [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"            history-substring-search-up
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}"          history-substring-search-down
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-histor

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# keybindings
bindkey -v
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^H' backward-kill-word
bindkey '^f' end-of-line
bindkey '^e' edit-command-line
bindkey '^f' end-of-line

# move whole words with ctrl and enable word deletion
bindkey '^[[3;5~' kill-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# edit current terminal in editor
autoload -Uz edit-command-line
zle -N edit-command-line

# alias
alias vim='nvim'
# eza
alias ls='exa --group-directories-first --icons --color-scale age --group'
alias lt='exa --tree --level=2 --icons' # Show in tree view
alias l='ls -a'                         # Short, all files
alias ld='l -D'                         # Short, only directories
alias ll='ls -lb --git'                # Long, file size prefixes, grid, git status
alias lll='ls -alb --git'

HISTSIZE=999999999
SAVEHIST=999999999
HISTFILE=~/.history

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '|%F{3}%b%f'

setopt PROMPT_SUBST
PROMPT='<%F{2}%n%f@%F{6}%m%f|%F{5}%~%f${vcs_info_msg_0_}%f> '
