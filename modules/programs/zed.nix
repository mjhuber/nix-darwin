{
  pkgs,
  filesDir,
  lib,
  ...
}:
{
  home.file =
    let
      # Get all files in the directory
      files = builtins.readDir "${filesDir}/zed";

      # Create a set mapping each file to its source
      # Use recursive = true to copy files instead of symlinking
      fileLinks = lib.mapAttrs' (name: _: {
        name = ".config/zed/${name}";
        value = {
          source = "${filesDir}/zed/${name}";
          # This copies the file instead of symlinking, making it writable
          recursive = false;
        };
      }) files;
    in
    fileLinks
    // {
      # Add the .keep file to the same set
      ".config/zed/.keep" = {
        text = "";
      };
    };

  # Alternative: Use activation script to copy files after Home Manager creates symlinks
  home.activation.copyZedConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -L "$HOME/.config/zed/settings.json" ]; then
      $DRY_RUN_CMD rm -f $HOME/.config/zed/settings.json
      $DRY_RUN_CMD cp ${filesDir}/zed/settings.json $HOME/.config/zed/settings.json
      $DRY_RUN_CMD chmod 644 $HOME/.config/zed/settings.json
    fi
    if [ -L "$HOME/.config/zed/keymap.json" ]; then
      $DRY_RUN_CMD rm -f $HOME/.config/zed/keymap.json
      $DRY_RUN_CMD cp ${filesDir}/zed/keymap.json $HOME/.config/zed/keymap.json
      $DRY_RUN_CMD chmod 644 $HOME/.config/zed/keymap.json
    fi
  '';
}
