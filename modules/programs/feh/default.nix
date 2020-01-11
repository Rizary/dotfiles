{ lib, pkgs, ... }:
{
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.feh ];
  primary-user.home-manager.programs.feh.enable = true;
}
