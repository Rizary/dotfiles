{ pkgs, lib, ... }:

{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.firefox ];
  primary-user.home-manager.programs.firefox.enable = true;
  primary-user.home-manager.programs.firefox.enableAdobeFlash = false;
}
