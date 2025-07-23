# Aliases
alias ack = ag
alias brews = brew leaves
alias bt = docker run -it us-docker.pkg.dev/recharge-infra-services-8b42/gcr.io/build-tools:3 /bin/bash
alias cat = bat --style=plain
alias gauth = gcloud auth application-default print-access-token out+err> /dev/null; or gcloud auth application-default login
alias grep = grep -i
alias gh = atuin search
alias gti = git
alias history = atuin history list
alias k = kubectl
alias kns = kubens
alias kssh = kubectl node-shell
alias kubnes = kubens
alias ls = eza
alias neat = kubectl-neat
alias sudo = sudo
alias tf = terraform
alias vim = nvim

# Custom commands (more complex than simple aliases)
def aliases [] {
    help aliases | get name | sort | str join "\n"
}

def path [] {
    $env.PATH | each { |p| echo $p }
}

# Conditional aliases based on OS
if (sys host | get name) != "Darwin" {
    alias pbcopy = xclip -selection clipboard
    alias pbpaste = xclip -selection clipboard -o
}
