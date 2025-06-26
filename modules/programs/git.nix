{
  pkgs,
  filesDir,
  config,
  hostname,
  ...
}: {
  home.packages = with pkgs; [
    git
  ];

  #home.file.".gitconfig".source = "${filesDir}/.gitconfig";
  home.file.".gitconfig".source = "${filesDir}/.gitconfig.${hostname}";
  home.file.".gitignore_global".source = "${filesDir}/.gitignore_global";

  home.file."${config.home.homeDirectory}/.git-template" = {
    source = "${filesDir}/git-templates";
    recursive = true;
    # IMPORTANT: If any files within git-templates need to be executable (like pre-commit),
    # you might need to set their permissions in your source directory
    # or handle them individually if permissions vary.
    # Home Manager will preserve source permissions when copying recursively.
    # For common git hooks, it's good practice to make them executable in your source.
  };
}
