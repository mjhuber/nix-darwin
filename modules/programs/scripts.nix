{
  lib,
  pkgs,
  filesDir,
  ...
}: {
  home.file = 
    let
      # Get all files in the directory
      files = builtins.readDir "${filesDir}/scripts";
      
      # Create a set mapping each file to its source
      fileLinks = lib.mapAttrs' 
        (name: _: {
          name = "scripts/${name}";
          value = { source = "${filesDir}/${name}"; };
        })
        files;
    in
      fileLinks;

  #home.file."scripts/.keep".text = "";
}
