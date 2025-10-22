{
  pkgs,
  filesDir,
  ...
}: {
  programs.go = {
    enable = true;
    env = {
      GOPATH = "$HOME/go";
      GOBIN = "$HOME/go/bin";
    };
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
