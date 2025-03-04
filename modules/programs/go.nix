{
  pkgs,
  filesDir,
  ...
}: {
  programs.go = {
    enable = true;
    goPath = "go";
    goBin = "go/bin";
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];

}
