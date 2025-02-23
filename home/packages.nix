{pkgs, ...}: {
  home.packages = with pkgs; [
    _1password-cli
    bat
    eza
    google-cloud-sdk
  ];
}
