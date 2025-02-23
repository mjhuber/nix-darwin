{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    eza
    google-cloud-sdk
  ];
}
