{
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    neovim
  ];

  home.file.".config/nvim/init.vim".source = "${filesDir}/init.vim";

  # vim-plug
  home.file.".local/share/nvim/site/autoload/plug.vim" = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
      sha256 = "1nywzjd9nfr7sqqbdi69wza305q3vp26i0390j1884wdz6awid10";
    };
  };
}
