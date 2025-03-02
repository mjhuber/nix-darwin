{ pkgs, username, ... }: {
  home.file.".zshrc".source = ../files/zsh/.zshrc;
  home.file.".functions".source = ../files/zsh/.functions;
  home.file.".aliases".source = ../files/zsh/.aliases;
  home.file.".exports".source = ../files/zsh/.exports;
  home.file.".gitconfig".source = ../files/.gitconfig;
  home.file.".gitignore".source = ../files/.gitignore_global;
  home.file.".p10k.zsh".source = ../files/zsh/.p10k.zsh;
  home.file.".curlrc".source = ../files/.curlrc;
  home.file.".ackrc".source = ../files/.ackrc;
  home.file.".config/nvim/init.vim".source = ../files/init.vim;
  home.file.".ssh/config".source = ../files/ssh_config;
  home.file.".config/zed/settings.json".source = ../files/zed/settings.json;
  home.file.".config/zed/keymap.json".source = ../files/zed/keymap.json;
  home.file.".config/zed/themes/penumbra.json".source = ../files/zed/themes/penumbra.json;

  # powerlevel10k
  home.file."powerlevel10k" = {
    source = pkgs.fetchFromGitHub {
      owner = "romkatv";
      repo = "powerlevel10k";
      rev = "v1.20.0";
      sha256 = "ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
    };
    recursive = true;
  };

  # zsh-autosuggestions
  home.file."zsh-autosuggestions" = {
    source = pkgs.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-autosuggestions";
      rev = "v0.7.1";
      sha256 = "vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
    };
    recursive = true;
  };

  # fast-syntax-highlighting
  home.file."fast-syntax-highlighting" = {
    source = pkgs.fetchFromGitHub {
      owner = "zdharma-continuum";
      repo = "fast-syntax-highlighting";
      rev = "v1.55";
      sha256 = "DWVFBoICroKaKgByLmDEo4O+xo6eA8YO792g8t8R7kA=";
    };
    recursive = true;
  };

  # vim-plug
  home.file.".local/share/nvim/site/autoload/plug.vim" = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
      sha256 = "1nywzjd9nfr7sqqbdi69wza305q3vp26i0390j1884wdz6awid10";
    };
  };
}
