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

  home.packages = with pkgs; [
    gocode-gomod
    godef
    golint
    gopkgs
    gopls
    gotools
    go-outline
  ];

}
