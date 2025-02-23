{pkgs, ...}: {
  home.packages = with pkgs; [
    google-cloud-sdk
    zsh-powerlevel10k
  ];
}
