{ pkgs, username, ... }: {
  home.file.".zshrc".source = ./dotfiles/zsh/.zshrc;
  home.file.".functions".source = ./dotfiles/zsh/.functions;
  home.file.".aliases".source = ./dotfiles/zsh/.aliases;
  home.file.".exports".source = ./dotfiles/zsh/.exports;
  home.file.".gitconfig".source = ./dotfiles/.gitconfig;
  home.file.".gitignore".source = ./dotfiles/.gitignore_global;

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
}
