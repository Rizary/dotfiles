{ pkgs, lib, ... }:
{
  primary-user.home-manager.programs.mpv.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.mpv ];
}
