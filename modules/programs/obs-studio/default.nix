{ pkgs, lib, ... }:
{
  primary-user.home-manager.programs.obs-studio.enable = true;
  primary-user.home-manager.programs.obs-studio.plugins = [ pkgs.obs-linuxbrowser ];
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.obs-studio ];
}
