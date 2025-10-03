{
  pkgs,
  filesDir,
  ...
}:{
  home.file.".config/zed/settings.json".source = "${filesDir}/config/zed/settings.json";
}
