# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload colors
colors


# The following lines were added by compinstall
zstyle :compinstall filename '/Users/huberm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.functions
source ~/.aliases
source ~/.exports

[[ ! -f ~/.secure ]] || source ~/.secure
[[ ! -f ~/.secrets ]] || source ~/.secrets

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# activate syntax highlighting
source ~/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# use a cache for completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

if [ -f ~/.rvm/scripts/rvm ]; then
  source ~/.rvm/scripts/rvm
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Appends every command to the history file once it is executed
setopt inc_append_history

# Reloads the history whenever you use it
setopt share_history

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/huberm/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/huberm/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/huberm/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/huberm/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# max open files
ulimit -n 10240

eval "$(atuin init zsh)"
