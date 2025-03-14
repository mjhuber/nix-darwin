{
  lib,
  pkgs,
  filesDir,
  ...
}: {
  home.packages = with pkgs; [
    zsh
  ];

  home.file.".zshrc".source = "${filesDir}/zsh/.zshrc";
  home.file.".functions".source = "${filesDir}/zsh/.functions";
  home.file.".aliases".source = "${filesDir}/zsh/.aliases";
  home.file.".exports".source = "${filesDir}/zsh/.exports";
  home.file.".p10k.zsh".source = "${filesDir}/zsh/.p10k.zsh";

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
