{
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    curl
  ];
  home.file.".curlrc".source = "${filesDir}/.curlrc";
}
