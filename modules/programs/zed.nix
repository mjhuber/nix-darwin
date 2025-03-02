{
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    zed-editor
  ];
  home.file.".config/zed/settings.json".source = "${filesDir}/zed/settings.json";
  home.file.".config/zed/keymap.json".source = "${filesDir}/zed/keymap.json";
  home.file.".config/zed/themes/penumbra.json".source = "${filesDir}/zed/themes/penumbra.json";
}
