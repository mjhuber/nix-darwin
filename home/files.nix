{ pkgs, username, ... }: {
  home.file.".zshrc".source = ./dotfiles/zsh/.zshrc;
  home.file.".functions".source = ./dotfiles/zsh/.functions;
  home.file.".aliases".source = ./dotfiles/zsh/.aliases;
  home.file.".exports".source = ./dotfiles/zsh/.exports;
  home.file.".gitconfig".source = ./dotfiles/.gitconfig;
  home.file.".gitignore".source = ./dotfiles/.gitignore_global;
  home.file.".p10k.zsh".source = ./dotfiles/zsh/.p10k.zsh;
  home.file.".curlrc".source = ./dotfiles/.curlrc;
  home.file.".ackrc".source = ./dotfiles/.ackrc;

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
}
