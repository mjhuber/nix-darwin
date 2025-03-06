{
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    starship
  ];
  home.file.".config/starship.toml".source = "${filesDir}/starship.toml";
}
