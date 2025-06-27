{
  pkgs,
  filesDir,
  config,
  hostname,
  useremail,
  ...
}: {
  home.packages = with pkgs; [
    git
  ];

  home.file.".gitconfig".source = pkgs.replaceVars (builtins.toString "${filesDir}/.gitconfig") {
    email = "${useremail}";
  };
  home.file.".gitignore_global".source = "${filesDir}/.gitignore_global";

  home.file."${config.home.homeDirectory}/.git-template" = {
    source = "${filesDir}/git-templates";
    recursive = true;
  };
}
