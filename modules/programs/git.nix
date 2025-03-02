{
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    git
  ];

  home.file.".gitconfig".source = "${filesDir}/.gitconfig";
  home.file.".gitignore_global".source = "${filesDir}/.gitignore_global";
}
