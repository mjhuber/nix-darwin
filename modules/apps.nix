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
    appcleaner
    coreutils
    hack-font
    home-manager
    mas
    mkalias
    obsidian
    slack
    vim
    vscode
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
      JuxtText = 6504801865;
    };

    taps = [
      "homebrew/services"
      "mfuentesg/tap"
    ];

    # `brew install`
    # add your apps here.
    brews = [
      "ksd"
    ];

    # `brew install --cask`
    # add your apps here.
    casks = [
      "alfred"
      "arc"
      "bartender"
      "bazecor"
      "betterdisplay"
      "busycal"
      "claude"
      "cleanshot"
      "clop"
      "contexts"
      "firefox"
      "logi-options+"
      "moom"
      "orbstack"
      "pdf-expert"
      "popclip"
    ];
  };
}
