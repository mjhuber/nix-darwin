$env.EDITOR = 'hx'
$env.ERL_AFLAGS = "-kernel shell_history enabled"
$env.GOBIN = ($env.HOME | path join "go" "bin")
$env.GOPATH = ($env.HOME | path join "go")
$env.GO111MODULE = "on"
$env.GPG_TTY = (tty)
$env.HELM_HOME = ($env.HOME | path join ".helm")
$env.HELM_PLUGINS = ($env.HELM_HOME | path join "plugins")
$env.HTTPSTAT_SHOW_SPEED = "true"
$env.LANG = 'en_US.UTF-8'
$env.LC_ALL = 'en_US.UTF-8'
$env.LESS_TERMCAP_md = $"(ansi yellow)"
$env.OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES"
$env.PYTHONIOENCODING = 'UTF-8'
$env.USE_GKE_GCLOUD_AUTH_PLUGIN = "True"


# PATH modifications
$env.PATH = ($env.PATH | split row (char esep) | append [
    $env.GOPATH
    $env.GOBIN
    ($env.HOME | path join ".krew" "bin")
    ([$env.HOME ".asdf"] | path join | path join "shims")
    ($env.HOME | path join "scripts")
    "/opt/homebrew/bin"
    ($env.HOME | path join ".local" "bin")
] | uniq)
