{
  lib,
  pkgs,
  filesDir,
  ...
}: {
  home.file = 
    let
      # Get all files in the directory
      files = builtins.readDir "${filesDir}/nushell";
      
      # Create a set mapping each file to its source
      fileLinks = lib.mapAttrs' 
        (name: _: {
          name = ".config/nushell/${name}";
          value = { source = "${filesDir}/nushell/${name}"; };
        })
        files;
    in
      fileLinks // {
        # Add the .keep file to the same set
        "nushell/.keep" = { text = ""; };
      };
}
