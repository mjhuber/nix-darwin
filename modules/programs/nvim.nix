{
  pkgs,
  lib,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    neovim
  ];

  # home.file.".config/nvim/init.vim".source = "${filesDir}/init.vim";

  home.file =
    let
      # Get all files in the directory
      files = builtins.readDir "${filesDir}/nvim";

      # Create a set mapping each file to its source
      fileLinks = lib.mapAttrs' (name: _: {
        name = ".config/nvim/${name}";  # Remove the ~
        value = {
          source = "${filesDir}/nvim/${name}";
        };
      }) files;
    in
    fileLinks
    // {
      # Add the .keep file to the same set
      "nvim/.keep" = {
        text = "";
      };

      # vim-plug
      ".local/share/nvim/site/autoload/plug.vim" = {
        source = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
          sha256 = "1nywzjd9nfr7sqqbdi69wza305q3vp26i0390j1884wdz6awid10";
        };
      };
    };
}
