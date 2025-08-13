{ pkgs, lib, ... }:
{
  primary-user.home-manager.services.syncthing.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.syncthing ];
}
