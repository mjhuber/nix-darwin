{ username, ... }: {
  home.file.".zshrc".source = ./dotfiles/zsh/.zshrc;
  home.file.".functions".source = ./dotfiles/zsh/.functions;
  home.file.".aliases".source = ./dotfiles/zsh/.aliases;
  home.file.".exports".source = ./dotfiles/zsh/.exports;
  home.file.".gitconfig".source = ./dotfiles/.gitconfig;
  home.file.".gitignore".source = ./dotfiles/.gitignore_global;
}
