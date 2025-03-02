{
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    openssh
  ];
  home.file.".ssh/config".source = "${filesDir}/ssh_config";
}
