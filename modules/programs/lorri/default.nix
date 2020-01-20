{ pkgs, lib, ... }:
{
  primary-user.home-manager.services.lorri.enable = true;
  primary-user.home-manager.home.packages = lib.mkForce [ pkgs.lorri ];
}
