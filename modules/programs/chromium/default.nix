{ pkgs, lib, ... }:

{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.google-chrome-dev ];

  # Chromium
  #primary-user.home-manager.programs.chromium.enable = true;
  #primary-user.home-manager.programs.chromium.package = pkgs.chromium;

  # Google Chrome Dev
  primary-user.home-manager.programs.google-chrome-dev.enable = true;
  primary-user.home-manager.programs.google-chrome-dev.package = pkgs.google-chrome-dev;
}
