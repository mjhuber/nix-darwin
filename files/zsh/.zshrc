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

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

# activate syntax highlighting
source ~/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# use a cache for completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

eval "$(direnv hook zsh)"

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

eval "$(starship init zsh)"
