{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
    google-cloud-sdk
  ];
}
