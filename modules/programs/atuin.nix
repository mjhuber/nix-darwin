{
  pkgs,
  filesDir,
  ...
}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      auto_sync = true;
    };
  };
}
