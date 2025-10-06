{
  modDir,
  pkgs,
  username,
  useremail,
  hostname,
  ...
}:

{
  # import sub modules
  imports = [
    "${modDir}/programs/atuin.nix"
    "${modDir}/programs/curl.nix"
    "${modDir}/programs/git.nix"
    "${modDir}/programs/go.nix"
    "${modDir}/programs/nvim.nix"
    "${modDir}/programs/openssh.nix"
    "${modDir}/programs/scripts.nix"
    "${modDir}/programs/wezterm.nix"
    "${modDir}/programs/zsh.nix"
    "${modDir}/programs/helix.nix"
    "${modDir}/programs/zed.nix"
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    packages = with pkgs; [
      _1password-cli
      # currently marked as broken
      # https://github.com/NixOS/nixpkgs/issues/254944
      # _1password-gui
      bat
      dbeaver-bin
      claude-code
      delta
      direnv
      discord
      elixir
      envsubst
      erlang
      eza
      fzf
      glab
      gleam
      gnugrep
      gnused
      golangci-lint
      (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
      grpcurl
      helm-docs
      helmfile-wrapped
      jq
      krew
      kubectl
      kubectl-neat
      kubernetes-helm
      kubie
      nil
      nodejs-slim
      pipenv
      pipx
      poetry
      rebar3
      signal-desktop-bin
      silver-searcher
      spotify
      stern
      tfmigrate
      tree
      unixtools.watch
      vals
      vault
      wget
      youtube-music
      yq-go
      zoom-us
    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
