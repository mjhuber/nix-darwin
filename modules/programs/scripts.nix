{
  lib,
  filesDir,
  ...
}:
{
  home.file =
    let
      # Get all files in the directory
      files = builtins.readDir "${filesDir}/scripts";

      # Create a set mapping each file to its source
      fileLinks = lib.mapAttrs' (name: _: {
        name = "scripts/${name}";
        value = {
          source = "${filesDir}/scripts/${name}";
        };
      }) files;
    in
    fileLinks
    // {
      # Add the .keep file to the same set
      "scripts/.keep" = {
        text = "";
      };
    };

  home.activation = {
    makeScriptsExecutable = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      find $HOME/scripts -type f -not -path "*/\.*" -exec chmod +x {} \;
    '';
  };
}
