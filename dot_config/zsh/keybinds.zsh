# Key bindings
bindkey -e
bindkey "^h" backward-word
bindkey "^l" forward-word

autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

# Fancy Ctrl-Z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# History search for current buffer prefix on Up/Down arrows
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # Up arrow
bindkey '^[[B' down-line-or-beginning-search # Down arrow