{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    ack
    appcleaner
    asdf-vm
    atuin
    coreutils
    direnv
    elixir
    hack-font
    git
    gnugrep
    gnused
    go
    jq
    krew
    kubectl
    kubectx
    kubernetes-helm
    kubie
    mas
    mkalias
    neovim
    obsidian
    pre-commit
    silver-searcher
    slack
    stern
    tree
    unixtools.watch
    vscode
    wezterm
    wget
    youtube-music
    yq-go
    zsh
  ];

  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas 
    masApps = {
      OnePassword = 1333542190;
      TheUnarchiver = 425424353;
      Pages = 409201541;
      Numbers = 409203825;
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    # add your apps here.
    brews = [
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    # add your apps here.
    casks = [
      "alfred"
      "bartender"
      "bazecor"
      "betterdisplay"
      "claude"
      "cleanshot"
      "clop"
      "contexts"
      "fantastical"
      "firefox"
      "logi-options+"
      "moom"
      "popclip"
      "zed"
      # "google-chrome"
    ];
  };
}
