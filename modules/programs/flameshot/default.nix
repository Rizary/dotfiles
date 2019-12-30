{ pkgs, lib, ... }:
{
  primary-user.home-manager.services.flameshot.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.flameshot ];
}
